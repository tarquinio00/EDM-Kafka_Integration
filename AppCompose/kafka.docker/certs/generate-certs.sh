#!/bin/bash
#============================================================================
#       FILE: generate-certs.sh
#       USAGE: ./generate-certs.sh
#   DESCRIPTION: Script to generate self-signed certificates for:
#                   1. Certificate Authority (CA)
#                       1.1 Domain (localhost)
#                   2. InfluxDB
#                   3. Mosquitto MQTT Broker
#                   4. Keycloack SSO Provider
#                   5. Web Root Frontend
#
#============================================================================

CERTSDIR="certs"

# NOTE: Feel free to change the Geographical/Organizational Information Here
# NOTE: DO NOT change the `OU` or `CN` values

# Use IP Address for CN
CN=$(hostname -I | awk '{print $1}')
echo "CN :"
CN="camel.smartassembly.com"

SUBJECT_CA="/C=IT/ST=Puglia/L=Foggia/O=LAN System SmartAssembly s.r.l/OU=Certificate Authority"
SUBJECT_DOMAIN="/C=IT/ST=Puglia/L=Foggia/O=SmartAssembly Camel/OU=SmartAssembly/CN=${CN}"


cd $(pwd)/$CERTSDIR


function generate_ca() {
        #===========================================================================
        #       Generating Certificate Authority Key Pair
        #===========================================================================

        echo "STEP1: Generating Certificate Authority"
        echo $SUBJECT_CA

        openssl req -new -x509 -days 10950 -subj "$SUBJECT_CA" -keyout ca.key -out ca.crt
}


function generate_domain_cert() {
        #===========================================================================
        #       Generating Certificate for Local Domain
        #===========================================================================
        echo "Step1.1: Generating Private Key for Local Domain"

        openssl genrsa -out domain.key 2048

        echo "Step 1.2: Generating A Signing Request for Local Domain Cert"

        openssl req -out domain.csr -key domain.key -subj "$SUBJECT_DOMAIN" -new  -reqexts SAN -config <(cat /etc/ssl/openssl.cnf <(printf "[SAN]\nsubjectAltName=DNS:${CN}")) 

        echo "Step 1.3: Sending CSR to the CA"

        openssl x509 -req -in domain.csr -CA ca.crt -CAkey ca.key -CAcreateserial -extensions SAN -extfile <(cat /etc/ssl/openssl.cnf <(printf "\n[SAN]\nsubjectAltName=DNS:${CN}")) -out domain.crt -days 10950
        
        echo "Generating Pfx Certificate - Dotnet Application"
        openssl pkcs12 -export -out domain.pfx -inkey domain.key -in domain.crt
}

function generate_keystore() {
        #===========================================================================
        #       Generating KeyStore for java application (like kafka)
        #===========================================================================

        echo "Generating KeyStore for java application (like kafka)"

        keytool -keystore truststore.jks -alias CARoot -import -file ca.crt
        keytool -importkeystore -srckeystore domain.pfx -srcstoretype pkcs12 -destkeystore truststore.jks -deststoretype JKS
        # Keytool importa con l'alias a 1 il certificato domain.pfx 
        keytool -changealias -alias "1" -destalias "localhost" -keystore truststore.jks 
}

function generate_graylog_cert() {
        #===========================================================================
        #       Generating Certificate for GRAYLOG
        #===========================================================================
        echo "Generating KeyStore for Graylog"
        
        openssl pkcs12 -in domain.pfx -nokeys -out graylog-certificate.pem
        openssl pkcs12 -in domain.pfx -nocerts -out graylog-pkcs5.pem
        openssl pkcs8 -in graylog-pkcs5.pem -topk8 -out graylog-key.pem
}


generate_ca
generate_domain_cert
generate_graylog_cert
generate_keystore

echo "Moving Certificates in to dedicated directories"


echo "Copying the CA Certificate for Mosquitto, InfluxDB, Grafana, Keycloak"


exit 0

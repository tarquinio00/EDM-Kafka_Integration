#!/bin/bash

CN="app.stage.local"

SUBJECT_DOMAIN="/C=IT/ST=Puglia/L=Foggia/O=Labs Application/OU=Labs/CN=${CN}"



function generate_domain_cert() {
        #===========================================================================
        #       Generating Certificate for Local Domain
        #===========================================================================
        echo "Step1.1: Generating Private Key for Local Domain"

        openssl genrsa -out app-domain.key 2048

        echo "Step 1.2: Generating A Signing Request for Local Domain Cert"

        openssl req -out app-domain.csr -key app-domain.key -subj "$SUBJECT_DOMAIN" -new  -reqexts SAN -config <(cat /etc/ssl/openssl.cnf <(printf "[SAN]\nsubjectAltName=DNS:${CN}")) 

        echo "Step 1.3: Sending CSR to the CA"

        openssl x509 -req -in app-domain.csr -CA ca.crt -CAkey ca.key -CAcreateserial -extensions SAN -extfile <(cat /etc/ssl/openssl.cnf <(printf "\n[SAN]\nsubjectAltName=DNS:${CN}")) -out app-domain.crt -days 10950
        
}

generate_domain_cert

exit 0

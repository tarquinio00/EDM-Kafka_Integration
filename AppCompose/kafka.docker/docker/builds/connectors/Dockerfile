FROM confluentinc/cp-kafka-connect-base:latest
USER root

#ENV CONNECT_PLUGIN_PATH="/usr/share/java/connect_plugins,/usr/share/confluent-hub-components"
ENV CONNECT_PLUGIN_PATH="/usr/share/confluent-hub-components"

# Copia del certificato nel percorso appropriato ed importazione del certificato
COPY ./certs/ca.crt /usr/lib/jvm/java-11-zulu-openjdk-ca/lib/security/
RUN keytool -delete -alias mycerts -cacerts -storepass changeit || true
RUN keytool -importcert -trustcacerts -keystore /usr/lib/jvm/java-11-zulu-openjdk-ca/lib/security/cacerts -alias mycerts -file /usr/lib/jvm/java-11-zulu-openjdk-ca/lib/security/ca.crt -storepass changeit -noprompt
#cd /usr/lib/jvm/java-11-zulu-openjdk-ca/lib/security/ percorso certs


#Copia del sink personalizzato 
COPY ./drivers/custom-connector-1.0.7.jar /usr/share/confluent-hub-components

# Installa il connettore Debezium
RUN confluent-hub install --no-prompt debezium/debezium-connector-mysql:latest


RUN dnf install -y findutils jq
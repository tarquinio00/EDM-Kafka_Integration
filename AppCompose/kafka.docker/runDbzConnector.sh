# Carica le variabili d'ambiente dal file .env
if [ -f .env ]; then
    source .env
fi

if [ -z "$MYSQL_SOURCE_USR_NAME" ]; then
    echo "La variabile USR_NAME non è presente."
    sleep 5
    exit 1
fi

if [ -z "$MYSQL_SOURCE_USR_PWD" ]; then
    echo "La variabile PWD non è presente."
    sleep 5
    exit 1
fi

# Nome del connettore
CONNECTOR_NAME="mysql-source-connector"

# Verifica se il connettore esiste già
response=$(curl -s -o /dev/null -w "%{http_code}" http://localhost:8083/connectors/$CONNECTOR_NAME)

if [ "$response" -eq 200 ]; then
    echo "Il connettore $CONNECTOR_NAME esiste già e verrà rimosso..."
    curl -X DELETE http://localhost:8083/connectors/$CONNECTOR_NAME
    sleep 5
fi

# Aggiorna il file source.json con il nome utente
jq --arg user_name_source "$MYSQL_SOURCE_USR_NAME" '.config."database.user" = $user_name_source' ./docker/builds/connectors/source-connector/mysql-source-connector.json > ./docker/builds/connectors/source-connector/temp.json
mv ./docker/builds/connectors/source-connector/temp.json ./docker/builds/connectors/source-connector/mysql-source-connector2.json

# Aggiorna il file source.json con la password
jq --arg user_pwd_source "$MYSQL_SOURCE_USR_PWD" '.config."database.password" = $user_pwd_source' ./docker/builds/connectors/source-connector/mysql-source-connector2.json > ./docker/builds/connectors/source-connector/temp.json
mv ./docker/builds/connectors/source-connector/temp.json ./docker/builds/connectors/source-connector/mysql-source-connector2.json

echo "Starting source..."
sleep 5

response=0
while [ "$response" -ne 201 ]; do
    response=$(curl -s -o /dev/null -w "%{http_code}" http://localhost:8083/connectors -H 'Content-Type: application/json' -X POST -d '@./docker/builds/connectors/source-connector/mysql-source-connector2.json')
    if [ "$response" -eq 201 ]; then
        echo "Debezium connector started"
    else
        echo "Failed to start source connector, response code: $response. Retrying in 5 seconds..."
        sleep 5
    fi
done

# Elimina il nuovo file creato dopo la richiesta 
rm ./docker/builds/connectors/source-connector/mysql-source-connector2.json

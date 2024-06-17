# Nome del connettore
CONNECTOR_NAME="custom-sink-connector"

# Verifica se il connettore esiste già
response=$(curl -s -o /dev/null -w "%{http_code}" http://localhost:8083/connectors/$CONNECTOR_NAME)

if [ "$response" -eq 200 ]; then
    echo "Il connettore $CONNECTOR_NAME esiste già e verrà rimosso..."
    curl -X DELETE http://localhost:8083/connectors/$CONNECTOR_NAME
    sleep 5
fi

echo "Starting custom sink connector..."
sleep 5

response=$(curl -s -o /dev/null -w "%{http_code}" http://localhost:8083/connectors -H 'Content-Type: application/json' -X POST -d '@./docker/builds/connectors/sink-connector/my-personal-sink.json')

if [ "$response" -eq 201 ]; then
    echo "Custom sink connector started"
else
    echo "Failed to start sink connector, response code: $response"
fi

#!/bin/bash

# Remember to add executable rights to this bash script
# By using: chmod +x start.sh

# To use this .sh => ./start.sh

NETWORK_NAME="cassandra-kafka"

# Check if the network exists
if ! docker network ls | awk '{print $2}' | grep -q "^$NETWORK_NAME$"; then
    echo "Network $NETWORK_NAME does not exist. Creating it..."
    docker network create "$NETWORK_NAME"
else
    echo "Network $NETWORK_NAME already exists. No action needed."
fi

# Build the Docker image
docker compose up airflow-init

# Run the Docker Compose
docker compose up -d --build
#!/bin/bash

# Remember to add executable rights to this bash script
# By using: chmod +x start.sh

# To use this .sh => ./start.sh

# Build the Docker image
docker compose -f docker-compose-airflow-only.yaml up airflow-init

# Run the Docker Compose
docker compose -f docker-compose-airflow-only.yaml up -d --build
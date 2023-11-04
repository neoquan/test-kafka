#!/bin/bash

# Remember to add executable rights to this bash script
# By using: chmod +x start.sh

# To use this .sh => ./start.sh

# Build the Docker image
docker compose up airflow-init

# Run the Docker Compose
docker compose up -d --build
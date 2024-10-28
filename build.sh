#!/bin/bash

# Navigate to the directory where docker-compose.yml is located
cd /path/to/your/repo/devops-build  # Update this path

# Build the Docker image
echo "Building Docker image..."
docker-compose build

# Optional: Tag the image (replace <your-dockerhub-username> with your Docker Hub username)
IMAGE_NAME="your-app-name"  # Replace with your app name
docker tag ${IMAGE_NAME} <your-dockerhub-username>/dev:latest
echo "Docker image built and tagged."


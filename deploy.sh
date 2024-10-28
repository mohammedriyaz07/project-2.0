#!/bin/bash

# Variables
IMAGE_NAME="myproject"
TAG="latest"
CONTAINER_NAME="mycontainer"
HOST_PORT="8080"  # Change this to the desired host port
CONTAINER_PORT="80"

# Stop and remove existing container if it exists
if [ "$(docker ps -q -f name=${CONTAINER_NAME})" ]; then
  echo "Stopping existing container ${CONTAINER_NAME}..."
  docker stop "${CONTAINER_NAME}"
  docker rm "${CONTAINER_NAME}"
fi

# Run the new container
echo "Deploying container ${CONTAINER_NAME} from image ${IMAGE_NAME}:${TAG} on port ${HOST_PORT}:${CONTAINER_PORT}..."
docker run -d -p "${HOST_PORT}:${CONTAINER_PORT}" --name "${CONTAINER_NAME}" "${IMAGE_NAME}:${TAG}"

# Check if deployment was successful
if [ $? -eq 0 ]; then
  echo "Container ${CONTAINER_NAME} deployed successfully and is running on port ${HOST_PORT}."
else
  echo "Failed to deploy container ${CONTAINER_NAME}."
  exit 1
fi


#!/bin/bash

#############################################################
# Push HRMS Docker Images to Docker Hub
#############################################################

set -euo pipefail

TAG=${1:-latest}

# Jenkins provides these variables through withCredentials
DOCKER_USER="${DOCKER_USER}"
DOCKER_PASS="${DOCKER_PASS}"

echo "======================================"
echo "Pushing HRMS Docker Images"
echo "Docker Hub User : ${DOCKER_USER}"
echo "Tag             : ${TAG}"
echo "======================================"

#########################################
# Docker Login
#########################################

echo
echo "Logging into Docker Hub..."

echo "${DOCKER_PASS}" | docker login \
    -u "${DOCKER_USER}" \
    --password-stdin

#########################################
# Tag Backend Image
#########################################

echo
echo "Tagging Backend Image..."

docker tag \
    hrms-backend:${TAG} \
    ${DOCKER_USER}/hrms-backend:${TAG}

#########################################
# Push Backend Image
#########################################

echo
echo "Pushing Backend Image..."

docker push \
    ${DOCKER_USER}/hrms-backend:${TAG}

#########################################
# Tag Frontend Image
#########################################

echo
echo "Tagging Frontend Image..."

docker tag \
    hrms-frontend:${TAG} \
    ${DOCKER_USER}/hrms-frontend:${TAG}

#########################################
# Push Frontend Image
#########################################

echo
echo "Pushing Frontend Image..."

docker push \
    ${DOCKER_USER}/hrms-frontend:${TAG}

#########################################
# Verify
#########################################

echo
echo "Images available on Docker Hub:"

docker images | grep hrms || true

#########################################
# Docker Logout
#########################################

echo
echo "Logging out from Docker Hub..."

docker logout

echo
echo "======================================"
echo "Docker Hub push completed successfully."
echo "======================================"

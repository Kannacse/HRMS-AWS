#!/bin/bash

#############################################################
# Build HRMS Docker Images
#############################################################

set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
PROJECT_ROOT="$(cd "${SCRIPT_DIR}/../.." && pwd)"

TAG=${1:-latest}

BACKEND_DIR="${PROJECT_ROOT}/Backend/hrms_feb_node/hrms_feb_node"
FRONTEND_DIR="${PROJECT_ROOT}/frontend/hrms_feb_flutter"

echo "======================================"
echo "Building HRMS Docker Images"
echo "Tag : ${TAG}"
echo "======================================"

#########################################
# Build Backend Image
#########################################

echo
echo "Building Backend..."

docker build \
    -t hrms-backend:${TAG} \
    "${BACKEND_DIR}"

#########################################
# Build Frontend Image
#########################################

echo
echo "Building Frontend..."

docker build \
    --build-arg BASE_URL="" \
    -t hrms-frontend:${TAG} \
    "${FRONTEND_DIR}"

#########################################
# Display Docker Images
#########################################

echo
echo "Docker Images"

docker images | grep hrms || true

echo
echo "======================================"
echo "Docker images built successfully."
echo "======================================"

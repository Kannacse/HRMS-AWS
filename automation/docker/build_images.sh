#!/bin/bash

#############################################################
# Build and Import HRMS Docker Images
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
    --build-arg BASE_URL=http://localhost \
    -t hrms-frontend:${TAG} \
    "${FRONTEND_DIR}"

#########################################
# Import Images into K3s
#########################################

echo
echo "Importing images into K3s..."

docker save hrms-backend:${TAG} \
    -o /tmp/hrms-backend-${TAG}.tar

sudo k3s ctr images import \
    /tmp/hrms-backend-${TAG}.tar

docker save hrms-frontend:${TAG} \
    -o /tmp/hrms-frontend-${TAG}.tar

sudo k3s ctr images import \
    /tmp/hrms-frontend-${TAG}.tar

rm -f /tmp/hrms-backend-${TAG}.tar
rm -f /tmp/hrms-frontend-${TAG}.tar

echo "Images imported successfully."

#########################################
# Display Images
#########################################

echo
echo "Docker Images"

docker images | grep hrms

echo
echo "K3s Images"

sudo k3s ctr images ls | grep hrms

echo
echo "======================================"
echo "Build completed successfully."
echo "======================================"

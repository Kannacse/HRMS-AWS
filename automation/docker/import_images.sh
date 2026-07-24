#!/bin/bash

#############################################################
# Import HRMS Docker Images into K3s
#############################################################

set -euo pipefail

TAG=${1:-latest}

echo "======================================"
echo "Importing HRMS Images into K3s"
echo "Tag : ${TAG}"
echo "======================================"

#########################################
# Backend
#########################################

echo
echo "Importing Backend Image..."

docker save \
    hrms-backend:${TAG} \
    -o /tmp/hrms-backend-${TAG}.tar

sudo k3s ctr images import \
    /tmp/hrms-backend-${TAG}.tar

#########################################
# Frontend
#########################################

echo
echo "Importing Frontend Image..."

docker save \
    hrms-frontend:${TAG} \
    -o /tmp/hrms-frontend-${TAG}.tar

sudo k3s ctr images import \
    /tmp/hrms-frontend-${TAG}.tar

#########################################
# Cleanup
#########################################

echo
echo "Cleaning temporary files..."

rm -f /tmp/hrms-backend-${TAG}.tar
rm -f /tmp/hrms-frontend-${TAG}.tar

#########################################
# Verify
#########################################

echo
echo "K3s Images"

sudo k3s ctr images ls | grep hrms || true

echo
echo "======================================"
echo "Images imported successfully."
echo "======================================"

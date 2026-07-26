#!/bin/bash

set -euo pipefail

TAG=${1:?Usage: ./update_image_tags.sh <tag>}

echo "========================================="
echo "Updating Kubernetes Image Tags"
echo "New Tag: ${TAG}"
echo "========================================="

echo "Updating Backend Deployment..."
sed -i "s|image: kannancloud/hrms-backend:.*|image: kannancloud/hrms-backend:${TAG}|g" \
kubernetes/hrms/backend-deployment.yaml

echo "Updating Frontend Deployment..."
sed -i "s|image: kannancloud/hrms-frontend:.*|image: kannancloud/hrms-frontend:${TAG}|g" \
kubernetes/frontend-deployment.yaml

echo
echo "========================================="
echo "Updated Images"
echo "========================================="
grep -R "image:" kubernetes/

echo
echo "GitOps manifest update completed successfully."

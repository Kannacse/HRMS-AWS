#!/bin/bash

#############################################################
# Deploy HRMS to Kubernetes
#############################################################

set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
PROJECT_ROOT="$(cd "${SCRIPT_DIR}/../.." && pwd)"

TAG=${1:-latest}

echo "======================================"
echo "Deploying HRMS"
echo "Tag: ${TAG}"
echo "======================================"

# Namespace
kubectl apply -f "${PROJECT_ROOT}/kubernetes/namespace/hrms-namespace.yaml"

# Database
kubectl apply -f "${PROJECT_ROOT}/kubernetes/database/mysql-pvc.yaml"
kubectl apply -f "${PROJECT_ROOT}/kubernetes/database/mysql-deployment.yaml"
kubectl apply -f "${PROJECT_ROOT}/kubernetes/database/mysql-service.yaml"

# Backend
kubectl apply -f "${PROJECT_ROOT}/kubernetes/hrms/configmap.yaml"
kubectl apply -f "${PROJECT_ROOT}/kubernetes/hrms/secret.yaml"
kubectl apply -f "${PROJECT_ROOT}/kubernetes/hrms/backend-deployment.yaml"
kubectl apply -f "${PROJECT_ROOT}/kubernetes/hrms/backend-service.yaml"

# Frontend
kubectl apply -f "${PROJECT_ROOT}/kubernetes/frontend-deployment.yaml"
kubectl apply -f "${PROJECT_ROOT}/kubernetes/frontend-service.yaml"

# Ingress
kubectl apply -f "${PROJECT_ROOT}/kubernetes/ingress/hrms-ingress.yaml"

echo
echo "Updating Images..."

kubectl set image deployment/hrms-backend \
hrms-backend=hrms-backend:${TAG} \
-n hrms

kubectl set image deployment/hrms-frontend \
hrms-frontend=hrms-frontend:${TAG} \
-n hrms

echo
echo "Waiting for Rollout..."

kubectl rollout status deployment/hrms-backend -n hrms
kubectl rollout status deployment/hrms-frontend -n hrms

echo
echo "Deployment Successful."

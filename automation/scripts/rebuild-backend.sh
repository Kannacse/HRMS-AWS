#!/bin/bash
set -e

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
PROJECT_ROOT="$(dirname "$(dirname "$SCRIPT_DIR")")"

BACKEND_DIR="$PROJECT_ROOT/Backend/hrms_feb_node/hrms_feb_node"

echo "Project Root : $PROJECT_ROOT"
echo "Backend Path : $BACKEND_DIR"

echo "========== Building Backend =========="
docker build -t hrms-backend:latest "$BACKEND_DIR"

echo "========== Exporting Image =========="
docker save hrms-backend:latest -o /tmp/hrms-backend.tar

echo "========== Importing into K3s =========="
sudo k3s ctr images import /tmp/hrms-backend.tar

echo "========== Restarting Deployment =========="
kubectl rollout restart deployment hrms-backend -n hrms

echo "========== Waiting for Rollout =========="
kubectl rollout status deployment/hrms-backend -n hrms

rm /tmp/hrms-backend.tar

echo "✅ Backend deployed successfully!"

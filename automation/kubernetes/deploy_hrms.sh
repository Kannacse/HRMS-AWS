#!/bin/bash 

#############################################################
# Deploy HRMS Application
#############################################################

set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

source "${SCRIPT_DIR}/../common/logger.sh"

MANIFEST_DIR="${SCRIPT_DIR}/../manifests"

log_info "Deploying HRMS..."

kubectl apply -f "${MANIFEST_DIR}/deployment.yaml"

kubectl apply -f "${MANIFEST_DIR}/service.yaml"

kubectl apply -f "${MANIFEST_DIR}/ingress.yaml"

kubectl rollout status deployment/hrms-backend

log_success "HRMS deployed successfully."

#!/bin/bash 

#############################################################
# Kubernetes Cleanup
#############################################################

set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

source "${SCRIPT_DIR}/../common/logger.sh"

MANIFEST_DIR="${SCRIPT_DIR}/../manifests"

log_info "Deleting HRMS..."

kubectl delete -f "${MANIFEST_DIR}/ingress.yaml" --ignore-not-found

kubectl delete -f "${MANIFEST_DIR}/service.yaml" --ignore-not-found

kubectl delete -f "${MANIFEST_DIR}/deployment.yaml" --ignore-not-found

kubectl delete -f "${MANIFEST_DIR}/pvc.yaml" --ignore-not-found

kubectl delete -f "${MANIFEST_DIR}/secret.yaml" --ignore-not-found

kubectl delete -f "${MANIFEST_DIR}/configmap.yaml" --ignore-not-found

kubectl delete -f "${MANIFEST_DIR}/namespace.yaml" --ignore-not-found

log_success "Kubernetes resources removed."

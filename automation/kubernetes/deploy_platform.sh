#!/bin/bash

#############################################################
# Deploy Platform Components
#############################################################

set -e

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

source "${SCRIPT_DIR}/../common/logger.sh"

MANIFEST_DIR="${SCRIPT_DIR}/../manifests"

log_info "Creating Namespace..."

kubectl apply -f "${MANIFEST_DIR}/namespace.yaml"

log_info "Creating ConfigMap..."

kubectl apply -f "${MANIFEST_DIR}/configmap.yaml"

log_info "Creating Secret..."

kubectl apply -f "${MANIFEST_DIR}/secret.yaml"

log_info "Creating Persistent Volume Claim..."

kubectl apply -f "${MANIFEST_DIR}/pvc.yaml"

log_success "Platform deployed."

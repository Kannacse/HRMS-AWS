#!/bin/bash

#############################################################
# Verify HRMS Platform
#############################################################

set -e

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

source "${SCRIPT_DIR}/../common/logger.sh"

log_info "Checking Docker..."

docker ps

echo

log_info "Checking Kubernetes..."

kubectl get nodes

echo

kubectl get pods -A

echo

log_info "Checking Services..."

kubectl get svc -A

echo

log_info "Checking Ingress..."

kubectl get ingress -A

echo

log_info "Checking Volumes..."

docker volume ls

echo

log_success "Platform verification completed."

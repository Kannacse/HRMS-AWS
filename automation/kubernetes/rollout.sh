#!/bin/bash

#############################################################
# Kubernetes Rollout
#############################################################

set -e

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

source "${SCRIPT_DIR}/../common/logger.sh"

DEPLOYMENT="hrms-backend"

log_info "Restarting Deployment..."

kubectl rollout restart deployment/${DEPLOYMENT}

kubectl rollout status deployment/${DEPLOYMENT}

log_success "Rollout completed."

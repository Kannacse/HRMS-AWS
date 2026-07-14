#!/bin/bash

#############################################################
# Scale Deployment
#############################################################

set -e

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

source "${SCRIPT_DIR}/../common/logger.sh"

if [ $# -ne 1 ]
then
    log_error "Usage: scale.sh <replicas>"
    exit 1
fi

kubectl scale deployment hrms-backend --replicas="$1"

kubectl get pods

log_success "Deployment scaled."

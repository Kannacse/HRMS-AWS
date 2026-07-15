#!/bin/bash

#############################################################
# Start SonarQube
#############################################################

set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

source "${SCRIPT_DIR}/../common/logger.sh"

CONTAINER="sonarqube"

if docker ps --format "{{.Names}}" | grep -q "^${CONTAINER}$"
then
    log_warn "SonarQube already running."
    exit 0
fi

log_info "Starting SonarQube..."

docker start ${CONTAINER}

sleep 5

log_success "SonarQube started."

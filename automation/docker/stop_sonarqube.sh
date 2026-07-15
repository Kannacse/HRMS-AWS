#!/bin/bash

#############################################################
# Stop SonarQube
#############################################################

set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

source "${SCRIPT_DIR}/../common/logger.sh"

CONTAINER="sonarqube"

if ! docker ps --format "{{.Names}}" | grep -q "^${CONTAINER}$"
then
    log_warn "SonarQube is already stopped."
    exit 0
fi

log_info "Stopping SonarQube..."

docker stop ${CONTAINER}

log_success "SonarQube stopped."

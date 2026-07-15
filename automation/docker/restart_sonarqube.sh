#!/bin/bash

#############################################################
# Restart SonarQube
#############################################################

set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

source "${SCRIPT_DIR}/../common/logger.sh"

CONTAINER="sonarqube"

log_info "Restarting SonarQube..."

docker restart ${CONTAINER}

sleep 5

log_success "SonarQube restarted."

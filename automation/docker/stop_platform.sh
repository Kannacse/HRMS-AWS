#!/bin/bash

#############################################################
# Stop HRMS DevOps Platform
#############################################################

set -e

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

source "${SCRIPT_DIR}/../common/logger.sh"
source "${SCRIPT_DIR}/../config/variables.conf"

log_info "Stopping HRMS DevOps Platform..."

if [ ! -f "${DOCKER_COMPOSE_FILE}" ]
then
    log_error "docker-compose.yml not found."
    exit 1
fi

docker compose \
-f "${DOCKER_COMPOSE_FILE}" \
down

log_success "Platform stopped successfully."

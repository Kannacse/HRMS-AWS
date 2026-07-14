#!/bin/bash

#############################################################
# Start HRMS DevOps Platform
#############################################################

set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

source "${SCRIPT_DIR}/../common/logger.sh"
source "${SCRIPT_DIR}/../config/variables.conf"

log_info "Starting HRMS DevOps Platform..."

#############################################################
# Verify Docker
#############################################################

if ! systemctl is-active --quiet docker
then
    log_info "Starting Docker service..."

    sudo systemctl start docker

    sudo systemctl enable docker
fi

#############################################################
# Verify Docker Compose File
#############################################################

if [ ! -f "${DOCKER_COMPOSE_FILE}" ]
then
    log_error "docker-compose.yml not found."

    exit 1
fi

#############################################################
# Start Platform
#############################################################

log_info "Starting containers..."

docker compose \
-f "${DOCKER_COMPOSE_FILE}" \
up -d

#############################################################
# Verify
#############################################################

log_info "Running containers..."

docker ps

log_success "HRMS DevOps Platform started successfully."

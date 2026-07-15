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
# Verify Docker Service
#############################################################

if ! systemctl is-active --quiet docker
then
    log_info "Starting Docker service..."

    systemctl start docker
    systemctl enable docker

    log_success "Docker service started."
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
# Create .env if Missing
#############################################################

if [ ! -f "${BACKEND_DIRECTORY}/.env" ]
then
    log_info "Creating .env from template..."

    cp "${BACKEND_DIRECTORY}/.env.example" \
       "${BACKEND_DIRECTORY}/.env"

    log_success ".env created successfully."
fi

#############################################################
# Verify Backend Image
#############################################################

if ! docker image inspect "${BACKEND_IMAGE}" >/dev/null 2>&1
then
    log_error "Backend image '${BACKEND_IMAGE}' not found."

    log_info "Run automation/docker/build_images.sh first."

    exit 1
fi

#############################################################
# Start Containers
#############################################################

log_info "Starting Docker containers..."

docker compose \
-f "${DOCKER_COMPOSE_FILE}" \
up -d --no-build

#############################################################
# Verify Running Containers
#############################################################

sleep 5

log_info "Running containers..."

docker ps

log_success "HRMS DevOps Platform started successfully."

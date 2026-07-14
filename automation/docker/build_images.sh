#!/bin/bash

#############################################################
# Build Docker Images
#############################################################

set -e

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

source "${SCRIPT_DIR}/../common/logger.sh"
source "${SCRIPT_DIR}/../config/variables.conf"

#############################################################
# Check Docker
#############################################################

if ! command -v docker >/dev/null 2>&1
then
    log_error "Docker is not installed."

    exit 1
fi

#############################################################
# Build Jenkins Image
#############################################################

log_info "Building Jenkins Docker image..."

docker build \
-t "${CUSTOM_JENKINS_IMAGE}" \
-f "${DOCKERFILE_JENKINS}" \
"${JENKINS_BUILD_CONTEXT}"

log_success "Jenkins image built successfully."

#############################################################
# Build Backend Image
#############################################################

log_info "Building HRMS Backend image..."

docker build \
-t "${BACKEND_IMAGE}" \
-f "${BACKEND_DOCKERFILE}" \
"${BACKEND_DIRECTORY}"

log_success "HRMS Backend image built successfully."

#############################################################
# Display Images
#############################################################

log_info "Available Docker images..."

docker images

log_success "Docker image build completed."

#############################################################
# Docker Build Configuration
#############################################################

CUSTOM_JENKINS_IMAGE="custom-jenkins:lts"

BACKEND_IMAGE="hrms-backend:latest"

JENKINS_BUILD_CONTEXT="../../DevOps"

DOCKERFILE_JENKINS="../../DevOps/Dockerfile.jenkins"

BACKEND_DIRECTORY="../../Backend/hrms_feb_node/hrms_feb_node"

BACKEND_DOCKERFILE="../../Backend/hrms_feb_node/hrms_feb_node/Dockerfile"

DOCKER_COMPOSE_FILE="../../DevOps/docker-compose.yml"

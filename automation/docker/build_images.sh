#!/bin/bash

#############################################################
# Build Docker Images
#############################################################

set -euo pipefail

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
# Build Backend Image
#############################################################

log_info "Building HRMS Backend image..."

docker build \
    -t "${BACKEND_IMAGE}" \
    -f "${BACKEND_DOCKERFILE}" \
    "${BACKEND_DIRECTORY}"

log_success "Backend image built."

#############################################################
# Display Images
#############################################################

docker images

log_success "Docker image build completed."

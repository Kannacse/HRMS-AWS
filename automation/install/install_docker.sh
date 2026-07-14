#!/bin/bash

#############################################################
# Docker Installation
#############################################################

set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

source "${SCRIPT_DIR}/../common/logger.sh"

log_info "Checking Docker installation..."

if command -v docker >/dev/null 2>&1
then
    log_warn "Docker is already installed."
    docker --version
    exit 0
fi

log_info "Installing Docker..."

sudo dnf install -y docker

log_info "Starting Docker service..."

sudo systemctl enable docker
sudo systemctl start docker

log_info "Adding current user to docker group..."

sudo usermod -aG docker "$USER"

log_success "Docker installation completed."

docker --version 

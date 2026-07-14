#!/bin/bash

#############################################################
# Docker Compose Installation
#############################################################

set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

source "${SCRIPT_DIR}/../common/logger.sh"

log_info "Checking Docker Compose..."

if docker compose version >/dev/null 2>&1
then
    log_warn "Docker Compose already installed."
    docker compose version
    exit 0
fi

log_info "Installing Docker Compose Plugin..."

sudo dnf install -y docker-compose-plugin

log_success "Docker Compose installed."

docker compose version 

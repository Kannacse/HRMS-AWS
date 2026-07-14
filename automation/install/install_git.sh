#!/bin/bash

#############################################################
# Git Installation
#############################################################

set -e

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

source "${SCRIPT_DIR}/../common/logger.sh"

log_info "Checking Git installation..."

if command -v git >/dev/null 2>&1
then
    log_warn "Git is already installed."
    git --version
    exit 0
fi

log_info "Installing Git..."

sudo dnf install -y git

log_success "Git installation completed."

git --version

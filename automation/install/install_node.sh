#!/bin/bash

#############################################################
# NodeJS Installation
#############################################################

set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

source "${SCRIPT_DIR}/../common/logger.sh"

log_info "Checking NodeJS..."

if command -v node >/dev/null 2>&1
then
    log_warn "NodeJS already installed."
    node -v
    npm -v
    exit 0
fi

log_info "Installing NodeJS..."

sudo dnf install -y nodejs npm

log_success "NodeJS installation completed."

node -v
npm -v

#!/bin/bash

#############################################################
# Python Installation
#############################################################

set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

source "${SCRIPT_DIR}/../common/logger.sh"

log_info "Checking Python..."

if command -v python3 >/dev/null 2>&1
then
    log_warn "Python already installed."
    python3 --version
    exit 0
fi

log_info "Installing Python..."

sudo dnf install -y python3 python3-pip

log_success "Python installation completed."

python3 --version
pip3 --version

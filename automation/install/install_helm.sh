#!/bin/bash

#############################################################
# Helm Installation
#############################################################

set -e

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

source "${SCRIPT_DIR}/../common/logger.sh"

log_info "Checking Helm installation..."

if command -v helm >/dev/null 2>&1
then
    log_warn "Helm is already installed."
    helm version
    exit 0
fi

log_info "Downloading Helm..."

curl https://raw.githubusercontent.com/helm/helm/main/scripts/get-helm-3 | bash

log_success "Helm installation completed."

helm version

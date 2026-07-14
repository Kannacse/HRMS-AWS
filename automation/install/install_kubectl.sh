#!/bin/bash

#############################################################
# Kubernetes CLI Installation
#############################################################

set -e

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

source "${SCRIPT_DIR}/../common/logger.sh"

log_info "Checking kubectl installation..."

if command -v kubectl >/dev/null 2>&1
then
    log_warn "kubectl is already installed."
    kubectl version --client
    exit 0
fi

log_info "Downloading kubectl..."

curl -LO "https://dl.k8s.io/release/$(curl -Ls https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl"

chmod +x kubectl

sudo mv kubectl /usr/local/bin/

log_success "kubectl installation completed."

kubectl version --client

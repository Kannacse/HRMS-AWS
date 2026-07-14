#!/bin/bash

#############################################################
# K3s Installation
#############################################################

set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

source "${SCRIPT_DIR}/../common/logger.sh"

log_info "Checking K3s installation..."

if command -v k3s >/dev/null 2>&1
then
    log_warn "K3s is already installed."

    sudo kubectl get nodes

    exit 0
fi

log_info "Installing K3s..."

curl -sfL https://get.k3s.io | sh -

log_info "Waiting for K3s to start..."

sleep 20

log_info "Configuring kubectl..."

mkdir -p "$HOME/.kube"

sudo cp /etc/rancher/k3s/k3s.yaml "$HOME/.kube/config"

sudo chown "$(id -u):$(id -g)" "$HOME/.kube/config"

export KUBECONFIG="$HOME/.kube/config"

log_success "K3s installation completed."

sudo kubectl get nodes 

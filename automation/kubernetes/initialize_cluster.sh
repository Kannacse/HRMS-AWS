#!/bin/bash

#############################################################
# Initialize Kubernetes Cluster
#############################################################

set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

source "${SCRIPT_DIR}/../common/logger.sh"

log_info "Checking Kubernetes cluster..."

if ! command -v kubectl >/dev/null 2>&1
then
    log_error "kubectl not installed."
    exit 1
fi

log_info "Checking K3s service..."

sudo systemctl start k3s

sudo systemctl enable k3s

export KUBECONFIG=/etc/rancher/k3s/k3s.yaml

log_info "Waiting for cluster..."

sleep 10

kubectl get nodes

kubectl cluster-info

log_success "Cluster initialized successfully." 

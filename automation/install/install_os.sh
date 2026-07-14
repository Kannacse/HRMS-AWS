#!/bin/bash

#############################################################
# Operating System Preparation
#############################################################

set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

source "${SCRIPT_DIR}/../common/logger.sh"
source "${SCRIPT_DIR}/../common/utils.sh"

log_info "Updating operating system..."

sudo dnf update -y

log_success "Operating system updated."

log_info "Installing common utilities..."

sudo dnf install -y \
curl \
wget \
git \
vim \
tar \
zip \
unzip \
jq \
net-tools \
tree \
which

log_success "Common utilities installed."

log_info "Installing Development Tools..."

sudo dnf groupinstall -y "Development Tools"

log_success "Development tools installed."

log_success "Operating system preparation completed." 

#!/bin/bash

#############################################################
# AWS CLI Installation
#############################################################

set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

source "${SCRIPT_DIR}/../common/logger.sh"

log_info "Checking AWS CLI..."

if command -v aws >/dev/null 2>&1
then
    log_warn "AWS CLI already installed."
    aws --version
    exit 0
fi

log_info "Downloading AWS CLI..."

cd /tmp

curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o awscliv2.zip

unzip -o awscliv2.zip

sudo ./aws/install

log_success "AWS CLI installed."

aws --version 

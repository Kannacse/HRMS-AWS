#!/bin/bash

#############################################################
# Java Installation
#############################################################

set -e

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

source "${SCRIPT_DIR}/../common/logger.sh"

log_info "Checking Java..."

if command -v java >/dev/null 2>&1
then
    log_warn "Java already installed."
    java -version
    exit 0
fi

log_info "Installing OpenJDK 17..."

sudo dnf install -y java-17-amazon-corretto

log_success "Java installation completed."

java -version

#!/bin/bash

#############################################################
# Docker Health Check
#############################################################

set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

source "${SCRIPT_DIR}/../common/logger.sh"

log_info "Docker Version"

docker --version

echo

log_info "Docker Service"

systemctl status docker --no-pager

echo

log_info "Docker Images"

docker images

echo

log_info "Docker Containers"

docker ps -a

echo

log_info "Docker Networks"

docker network ls

echo

log_info "Docker Volumes"

docker volume ls

log_success "Docker health verification completed."

#!/bin/bash

#############################################################
# Docker Cleanup
#############################################################

set -e

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

source "${SCRIPT_DIR}/../common/logger.sh"

log_info "Cleaning Docker environment..."

docker container prune -f

docker image prune -f

docker network prune -f

docker volume prune -f

docker system df

log_success "Docker cleanup completed." 

#!/bin/bash

#############################################################
# Install cAdvisor
#############################################################

set -e

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

source "${SCRIPT_DIR}/../common/logger.sh"

log_info "Checking cAdvisor..."

if docker ps --format "{{.Names}}" | grep -q cadvisor
then
    log_warn "cAdvisor already running."

    exit 0
fi

log_info "Starting cAdvisor..."

docker run -d \
--name=cadvisor \
--restart unless-stopped \
-p 8081:8080 \
-v /:/rootfs:ro \
-v /var/run:/var/run:ro \
-v /sys:/sys:ro \
-v /var/lib/docker/:/var/lib/docker:ro \
gcr.io/cadvisor/cadvisor:latest

sleep 10

docker ps

log_success "cAdvisor started successfully."

echo

echo "Dashboard"

echo "http://localhost:8081"

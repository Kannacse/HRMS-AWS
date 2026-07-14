#!/bin/bash

#############################################################
# Docker Logs Collection
#############################################################

set -e

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

source "${SCRIPT_DIR}/../common/logger.sh"

LOG_DIR="$HOME/docker-logs"

mkdir -p "${LOG_DIR}"

log_info "Collecting Jenkins logs..."

docker logs jenkins > "${LOG_DIR}/jenkins.log" 2>&1 || true

log_info "Collecting SonarQube logs..."

docker logs sonarqube > "${LOG_DIR}/sonarqube.log" 2>&1 || true

log_info "Collecting PostgreSQL logs..."

docker logs sonarqube-db > "${LOG_DIR}/postgres.log" 2>&1 || true

log_info "Collecting HRMS Backend logs..."

docker logs hrms-backend > "${LOG_DIR}/backend.log" 2>&1 || true

log_success "Docker logs collected."

ls -lh "${LOG_DIR}"

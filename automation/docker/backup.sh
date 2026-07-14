#!/bin/bash

#############################################################
# Docker Volume Backup
#############################################################

set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

source "${SCRIPT_DIR}/../common/logger.sh"

BACKUP_DIR="$HOME/docker-backups"

mkdir -p "${BACKUP_DIR}"

DATE=$(date +"%Y%m%d_%H%M%S")

log_info "Backing up Jenkins volume..."

docker run --rm \
-v devops_jenkins_home:/volume \
-v "${BACKUP_DIR}":/backup \
alpine \
tar czf "/backup/jenkins_${DATE}.tar.gz" -C /volume .

log_info "Backing up SonarQube volume..."

docker run --rm \
-v devops_sonarqube_data:/volume \
-v "${BACKUP_DIR}":/backup \
alpine \
tar czf "/backup/sonarqube_${DATE}.tar.gz" -C /volume .

log_info "Backing up PostgreSQL volume..."

docker run --rm \
-v devops_postgres_data:/volume \
-v "${BACKUP_DIR}":/backup \
alpine \
tar czf "/backup/postgres_${DATE}.tar.gz" -C /volume .

log_success "Docker backup completed."

ls -lh "${BACKUP_DIR}"

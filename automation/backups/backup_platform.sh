#!/bin/bash

#############################################################
# Platform Backup
#############################################################

set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

source "${SCRIPT_DIR}/../common/logger.sh"

BACKUP_DIR="${SCRIPT_DIR}/../reports/backups"

DATE=$(date +"%Y%m%d_%H%M%S")

mkdir -p "${BACKUP_DIR}"

log_info "Starting platform backup..."

docker run --rm \
-v devops_jenkins_home:/data \
-v "${BACKUP_DIR}":/backup \
alpine \
tar czf "/backup/jenkins_${DATE}.tar.gz" -C /data .

docker run --rm \
-v devops_sonarqube_data:/data \
-v "${BACKUP_DIR}":/backup \
alpine \
tar czf "/backup/sonarqube_${DATE}.tar.gz" -C /data .

docker run --rm \
-v devops_postgres_data:/data \
-v "${BACKUP_DIR}":/backup \
alpine \
tar czf "/backup/postgres_${DATE}.tar.gz" -C /data .

log_success "Platform backup completed."

ls -lh "${BACKUP_DIR}"

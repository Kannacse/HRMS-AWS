#!/bin/bash

#############################################################
# Platform Restore
#############################################################

set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

source "${SCRIPT_DIR}/../common/logger.sh"

BACKUP_DIR="${SCRIPT_DIR}/../reports/backups"

log_info "Available backups"

ls -lh "${BACKUP_DIR}"

echo

read -p "Enter Jenkins backup file: " JENKINS

docker run --rm \
-v devops_jenkins_home:/data \
-v "${BACKUP_DIR}":/backup \
alpine \
tar xzf "/backup/${JENKINS}" -C /data

log_success "Jenkins restored."

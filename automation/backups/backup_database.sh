#!/bin/bash

#############################################################
# PostgreSQL Backup
#############################################################

set -e

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

source "${SCRIPT_DIR}/../common/logger.sh"

DATE=$(date +"%Y%m%d_%H%M%S")

BACKUP_DIR="${SCRIPT_DIR}/../reports/backups"

mkdir -p "${BACKUP_DIR}"

log_info "Creating PostgreSQL dump..."

docker exec postgres \
pg_dumpall -U postgres \
> "${BACKUP_DIR}/postgres_dump_${DATE}.sql"

log_success "Database backup completed."

ls -lh "${BACKUP_DIR}"

#!/bin/bash

#############################################################
# PostgreSQL Restore
#############################################################

set -e

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

source "${SCRIPT_DIR}/../common/logger.sh"

BACKUP_DIR="${SCRIPT_DIR}/../reports/backups"

ls -lh "${BACKUP_DIR}"

echo

read -p "Enter SQL backup file: " FILE

cat "${BACKUP_DIR}/${FILE}" | docker exec -i postgres psql -U postgres

log_success "Database restored."

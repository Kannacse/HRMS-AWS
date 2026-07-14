#!/bin/bash

#############################################################
# Backup Cleanup
#############################################################

set -e

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

source "${SCRIPT_DIR}/../common/logger.sh"

BACKUP_DIR="${SCRIPT_DIR}/../reports/backups"

log_info "Current backups"

ls -lh "${BACKUP_DIR}"

echo

read -p "Delete backups older than 7 days? (y/n): " OPTION

if [[ "$OPTION" == "y" || "$OPTION" == "Y" ]]
then

    find "${BACKUP_DIR}" -type f -mtime +7 -delete

    log_success "Old backups deleted."

else

    log_warn "Cleanup cancelled."

fi

echo

ls -lh "${BACKUP_DIR}"

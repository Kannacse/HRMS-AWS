#!/bin/bash

#############################################################
# Restore Docker Volume
#############################################################

set -e

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

source "${SCRIPT_DIR}/../common/logger.sh"

if [ $# -lt 2 ]
then
    log_error "Usage: restore.sh <volume_name> <backup_file>"
    exit 1
fi

VOLUME_NAME="$1"
BACKUP_FILE="$2"

log_info "Restoring ${VOLUME_NAME}..."

docker run --rm \
-v "${VOLUME_NAME}":/volume \
-v "$(dirname "${BACKUP_FILE}")":/backup \
alpine \
tar xzf "/backup/$(basename "${BACKUP_FILE}")" -C /volume

log_success "Restore completed."

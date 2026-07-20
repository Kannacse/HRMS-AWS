#!/bin/bash

#############################################################
# Initialize HRMS Database
#############################################################

set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

source "${SCRIPT_DIR}/../common/logger.sh"
source "${SCRIPT_DIR}/../config/variables.conf"

#############################################################
# Database Dump Location
#############################################################

SQL_DUMP_DIR="${WORKSPACE}/HRMS-AWS/database/Dump20260218"

#############################################################
# Validate
#############################################################

if [ ! -d "${SQL_DUMP_DIR}" ]; then
    log_error "SQL dump directory not found: ${SQL_DUMP_DIR}"
    exit 1
fi

#############################################################
# Check Connection
#############################################################

log_info "Verifying database connection..."

mysql \
    -h "${DB_HOST}" \
    -P "${DB_PORT}" \
    -u "${DB_USER}" \
    -p"${DB_PASSWORD}" \
    -e "USE ${DB_NAME};"

#############################################################
# Import Database
#############################################################

log_info "Importing SQL dump files..."

shopt -s nullglob

SQL_FILES=("${SQL_DUMP_DIR}"/*.sql)

TOTAL=${#SQL_FILES[@]}

if [ "${TOTAL}" -eq 0 ]; then
    log_error "No SQL files found."
    exit 1
fi

COUNT=1

for file in "${SQL_FILES[@]}"
do
    log_info "[${COUNT}/${TOTAL}] Importing $(basename "$file")"

    mysql \
        -h "${DB_HOST}" \
        -P "${DB_PORT}" \
        -u "${DB_USER}" \
        -p"${DB_PASSWORD}" \
        "${DB_NAME}" < "$file"

    COUNT=$((COUNT + 1))
done

log_success "Database imported successfully."

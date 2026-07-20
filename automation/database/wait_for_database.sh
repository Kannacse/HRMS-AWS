#!/bin/bash

#############################################################
# Wait for AWS RDS Database
#############################################################

set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

source "${SCRIPT_DIR}/../common/logger.sh"

#############################################################
# Validate Environment
#############################################################

required=(
    DB_HOST
    DB_PORT
    DB_NAME
    DB_USER
    DB_PASSWORD
)

for var in "${required[@]}"
do
    if [ -z "${!var:-}" ]
    then
        log_error "$var is not set."

        exit 1
    fi
done

#############################################################
# Wait for Database
#############################################################

log_info "Waiting for database..."

MAX_RETRIES=60

SLEEP_TIME=10

COUNT=1

until mysqladmin ping \
    -h "${DB_HOST}" \
    -P "${DB_PORT}" \
    -u "${DB_USER}" \
    -p"${DB_PASSWORD}" \
    --silent
do

    if [ "${COUNT}" -ge "${MAX_RETRIES}" ]
    then
        log_error "Database is not reachable."

        exit 1
    fi

    log_info "Database not ready (${COUNT}/${MAX_RETRIES})..."

    COUNT=$((COUNT + 1))

    sleep "${SLEEP_TIME}"

done

log_success "Database is available."

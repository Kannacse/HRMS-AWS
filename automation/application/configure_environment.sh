#!/bin/bash

set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

source "${SCRIPT_DIR}/../common/logger.sh"
source "${SCRIPT_DIR}/../config/variables.conf"

log_info "Configuring HRMS environment..."

ENV_FILE="${BACKEND_DIRECTORY}/.env"
ENV_TEMPLATE="${BACKEND_DIRECTORY}/.env.example"

if [ ! -f "${ENV_TEMPLATE}" ]; then
    log_error ".env.example not found."
    exit 1
fi

cp "${ENV_TEMPLATE}" "${ENV_FILE}"

required_vars=(
    DB_HOST
    DB_PORT
    DB_NAME
    DB_USER
    DB_PASSWORD
)

for var in "${required_vars[@]}"; do
    if [ -z "${!var:-}" ]; then
        log_error "$var is not set."
        exit 1
    fi
done

sed -i "s|^DB_HOST=.*|DB_HOST=${DB_HOST}|" "${ENV_FILE}"
sed -i "s|^DB_PORT=.*|DB_PORT=${DB_PORT}|" "${ENV_FILE}"
sed -i "s|^DB_NAME=.*|DB_NAME=${DB_NAME}|" "${ENV_FILE}"
sed -i "s|^DB_USER=.*|DB_USER=${DB_USER}|" "${ENV_FILE}"
sed -i "s|^DB_PASSWORD=.*|DB_PASSWORD=${DB_PASSWORD}|" "${ENV_FILE}"

log_success ".env configured successfully."

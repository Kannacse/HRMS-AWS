#!/bin/bash

#############################################################
# Log Cleanup Utility
#############################################################

set -e

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

LOG_DIR="${SCRIPT_DIR}/../logs"

echo "========================================"
echo "HRMS Log Cleanup"
echo "========================================"

echo "Searching log files..."

find "${LOG_DIR}" -type f -name "*.log"

echo

read -p "Delete all log files? (y/n): " OPTION

if [[ "$OPTION" != "y" && "$OPTION" != "Y" ]]; then
    echo "Operation cancelled."
    exit 0
fi

find "${LOG_DIR}" -type f -name "*.log" -delete

echo

echo "Log cleanup completed."

echo "Remaining files:"

ls -lh "${LOG_DIR}"

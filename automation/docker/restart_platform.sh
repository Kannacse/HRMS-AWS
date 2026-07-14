#!/bin/bash

#############################################################
# Restart HRMS DevOps Platform
#############################################################

set -e

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

bash "${SCRIPT_DIR}/stop_platform.sh"

sleep 5

bash "${SCRIPT_DIR}/start_platform.sh"

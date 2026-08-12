#!/bin/bash

set -e

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

echo
echo "===================================================="
echo "        HRMS COMPLETE VALIDATION PIPELINE"
echo "===================================================="

"$SCRIPT_DIR/flutter.sh"
"$SCRIPT_DIR/docker.sh"
"$SCRIPT_DIR/kubernetes.sh"
"$SCRIPT_DIR/api.sh"

echo
echo "===================================================="
echo "        ALL VALIDATIONS PASSED"
echo "===================================================="

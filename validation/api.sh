#!/bin/bash

set -e

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
PROJECT_ROOT="$(dirname "$SCRIPT_DIR")"

source "$SCRIPT_DIR/utils.sh"

section "API Validation"

info "Testing Login API"

RESPONSE=$(curl -s \
-X POST \
http://hrms.local/api/hrms/login \
-H "Content-Type: application/json" \
-d '{
    "email":"admin@hrms.com",
    "password":"admin123"
}')

echo "$RESPONSE" | grep -q "token"

if [ $? -eq 0 ]; then
    pass "Login API"
else
    echo "$RESPONSE"
    fail "Login API"
fi

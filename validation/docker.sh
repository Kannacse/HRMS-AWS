#!/bin/bash

set -e

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
PROJECT_ROOT="$(dirname "$SCRIPT_DIR")"

source "$SCRIPT_DIR/utils.sh"

section "Docker Validation"

info "Building Frontend Docker Image"

docker build \
    -t hrms-frontend:test \
    "$PROJECT_ROOT/frontend/hrms_feb_flutter"

pass "Frontend Docker Build"

info "Building Backend Docker Image"

docker build \
    -t hrms-backend:test \
    "$PROJECT_ROOT/backend"

pass "Backend Docker Build"

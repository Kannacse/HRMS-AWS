#!/bin/bash

set -e

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
PROJECT_ROOT="$(dirname "$SCRIPT_DIR")"

source "$SCRIPT_DIR/utils.sh"

section "Kubernetes Validation"

info "Checking Frontend Rollout"

kubectl rollout status deployment/hrms-frontend -n hrms

pass "Frontend Rollout"

info "Checking Backend Rollout"

kubectl rollout status deployment/hrms-backend -n hrms

pass "Backend Rollout"

info "Checking MySQL Rollout"

kubectl rollout status deployment/mysql -n hrms

pass "MySQL Rollout"

info "Checking Pod Status"

kubectl get pods -n hrms

NOT_READY=$(kubectl get pods -n hrms \
--no-headers | awk '$3!="Running"{print}')

if [ -z "$NOT_READY" ]; then
    pass "All Pods Running"
else
    echo "$NOT_READY"
    fail "Some Pods Are Not Running"
fi

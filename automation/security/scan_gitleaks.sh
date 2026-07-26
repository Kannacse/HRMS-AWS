#!/bin/bash

set -e

REPORT_DIR="reports/gitleaks"

mkdir -p "$REPORT_DIR"

echo "========================================="
echo "Scanning Repository with Gitleaks"
echo "========================================="

gitleaks detect \
    --source . \
    --report-format sarif \
    --report-path "$REPORT_DIR/gitleaks-report.sarif" || true

echo
echo "========================================="
echo "Gitleaks Scan Completed"
echo "Report saved to:"
echo "$REPORT_DIR/gitleaks-report.sarif"
echo "========================================="

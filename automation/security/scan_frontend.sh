#!/bin/bash

set -e

IMAGE_NAME="hrms-frontend:test"
REPORT_DIR="reports/trivy"

mkdir -p "$REPORT_DIR"

echo "========================================="
echo "Scanning Frontend Image with Trivy"
echo "Image: $IMAGE_NAME"
echo "========================================="

trivy image \
  --skip-version-check \
  --scanners vuln \
  --severity HIGH,CRITICAL \
  --format table \
  --output "$REPORT_DIR/frontend-trivy-report.txt" \
  "$IMAGE_NAME"

echo
echo "========================================="
echo "Frontend Trivy Scan Completed"
echo "Report saved to:"
echo "$REPORT_DIR/frontend-trivy-report.txt"
echo "========================================="

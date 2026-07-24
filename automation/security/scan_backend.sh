#!/bin/bash

set -e

IMAGE_NAME="hrms-backend:test"
REPORT_DIR="reports/trivy"

mkdir -p "$REPORT_DIR"

echo "========================================="
echo "Scanning Backend Image with Trivy"
echo "Image: $IMAGE_NAME"
echo "========================================="

trivy image \
  --skip-version-check \
  --scanners vuln \
  --severity HIGH,CRITICAL \
  --format table \
  --output "$REPORT_DIR/backend-trivy-report.txt" \
  "$IMAGE_NAME"

echo
echo "========================================="
echo "Backend Trivy Scan Completed"
echo "Report saved to:"
echo "$REPORT_DIR/backend-trivy-report.txt"
echo "========================================="

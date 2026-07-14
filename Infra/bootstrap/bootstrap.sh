#!/bin/bash

set -euo pipefail

LOG_FILE="/var/log/hrms-bootstrap.log"

exec > >(tee -a "$LOG_FILE") 2>&1

echo "==========================================="
echo "HRMS Bootstrap Started"
echo "==========================================="

dnf update -y

dnf install -y git

mkdir -p /opt/hrms

cd /opt/hrms

git clone https://github.com/Kannacse/HRMS-AWS.git

cd HRMS-AWS

chmod +x automation/bootstrap.sh

./automation/bootstrap.sh

echo "==========================================="
echo "Bootstrap Completed"
echo "==========================================="

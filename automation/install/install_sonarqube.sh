#!/bin/bash

#############################################################
# Install SonarQube
#############################################################

set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

source "${SCRIPT_DIR}/../common/logger.sh"
source "${SCRIPT_DIR}/../config/variables.conf"

SONAR_IMAGE="sonarqube:lts-community"
SONAR_CONTAINER="sonarqube"

#############################################################
# Check Docker
#############################################################

if ! command -v docker >/dev/null 2>&1
then
    log_error "Docker is not installed."
    exit 1
fi

#############################################################
# Already Installed?
#############################################################

if docker ps -a --format "{{.Names}}" | grep -q "^${SONAR_CONTAINER}$"
then
    log_warn "SonarQube already installed."
    exit 0
fi

#############################################################
# Create Volume
#############################################################

log_info "Creating SonarQube volumes..."

docker volume create sonarqube_data >/dev/null
docker volume create sonarqube_logs >/dev/null
docker volume create sonarqube_extensions >/dev/null

#############################################################
# Pull Image
#############################################################

log_info "Pulling SonarQube image..."

docker pull ${SONAR_IMAGE}

#############################################################
# Run Container
#############################################################

log_info "Starting SonarQube..."

docker run -d \
--name ${SONAR_CONTAINER} \
-p 9000:9000 \
--restart unless-stopped \
-v sonarqube_data:/opt/sonarqube/data \
-v sonarqube_logs:/opt/sonarqube/logs \
-v sonarqube_extensions:/opt/sonarqube/extensions \
${SONAR_IMAGE}

#############################################################
# Wait
#############################################################

log_info "Waiting for SonarQube..."

sleep 40

#############################################################
# Verify
#############################################################

if docker ps --format "{{.Names}}" | grep -q "^${SONAR_CONTAINER}$"
then
    log_success "SonarQube installed successfully."
else
    log_error "SonarQube failed to start."
    exit 1
fi

echo
echo "SonarQube URL : http://localhost:9000"
echo "Username      : admin"
echo "Password      : admin"

#!/bin/bash

#############################################################
# Install Monitoring Stack
#############################################################

set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

source "${SCRIPT_DIR}/../common/logger.sh"

log_info "Installing Monitoring Stack..."

bash "${SCRIPT_DIR}/install_node_exporter.sh"

bash "${SCRIPT_DIR}/install_cadvisor.sh"

python3 "${SCRIPT_DIR}/configure_prometheus.py"

python3 "${SCRIPT_DIR}/configure_grafana.py"

python3 "${SCRIPT_DIR}/configure_loki.py"

python3 "${SCRIPT_DIR}/configure_promtail.py"

log_success "Monitoring Stack Installed Successfully."

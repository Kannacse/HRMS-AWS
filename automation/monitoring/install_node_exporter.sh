#!/bin/bash

#############################################################
# Install Node Exporter
#############################################################

set -e

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

source "${SCRIPT_DIR}/../common/logger.sh"

VERSION="1.9.1"

log_info "Checking Node Exporter..."

if command -v node_exporter >/dev/null 2>&1
then
    log_warn "Node Exporter already installed."

    node_exporter --version

    exit 0
fi

log_info "Creating node_exporter user..."

sudo useradd --no-create-home --shell /bin/false node_exporter || true

cd /tmp

log_info "Downloading Node Exporter..."

curl -LO https://github.com/prometheus/node_exporter/releases/download/v${VERSION}/node_exporter-${VERSION}.linux-amd64.tar.gz

tar -xzf node_exporter-${VERSION}.linux-amd64.tar.gz

sudo cp node_exporter-${VERSION}.linux-amd64/node_exporter /usr/local/bin/

sudo chown node_exporter:node_exporter /usr/local/bin/node_exporter

log_info "Creating systemd service..."

sudo tee /etc/systemd/system/node_exporter.service >/dev/null <<EOF
[Unit]
Description=Prometheus Node Exporter
After=network.target

[Service]
User=node_exporter
Group=node_exporter
ExecStart=/usr/local/bin/node_exporter

[Install]
WantedBy=multi-user.target
EOF

log_info "Reloading systemd..."

sudo systemctl daemon-reload

sudo systemctl enable node_exporter

sudo systemctl start node_exporter

sleep 5

sudo systemctl status node_exporter --no-pager

log_success "Node Exporter installed successfully."

echo

echo "Metrics URL"

echo "http://localhost:9100/metrics"

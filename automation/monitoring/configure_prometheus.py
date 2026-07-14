#!/usr/bin/env python3

"""
=============================================================
Configure Prometheus
=============================================================
"""

import os

PROMETHEUS_CONFIG = """
global:
  scrape_interval: 15s

scrape_configs:

- job_name: prometheus
  static_configs:
    - targets:
      - localhost:9090

- job_name: node_exporter
  static_configs:
    - targets:
      - localhost:9100

- job_name: cadvisor
  static_configs:
    - targets:
      - localhost:8081

- job_name: hrms-backend
  static_configs:
    - targets:
      - localhost:3000
"""

CONFIG_FILE = "/opt/prometheus/prometheus.yml"

os.makedirs("/opt/prometheus", exist_ok=True)

with open(CONFIG_FILE, "w") as file:
    file.write(PROMETHEUS_CONFIG)

print("Prometheus configuration generated.")

print(CONFIG_FILE)

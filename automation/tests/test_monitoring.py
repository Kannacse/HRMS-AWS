#!/usr/bin/env python3

"""
=============================================================
Test Monitoring Stack
=============================================================
"""

import requests

services = {

    "Prometheus": "http://localhost:9090",

    "Grafana": "http://localhost:3001",

    "Node Exporter": "http://localhost:9100",

    "cAdvisor": "http://localhost:8081"

}

print("=" * 60)
print("Monitoring Test")
print("=" * 60)

for service, url in services.items():

    try:

        response = requests.get(url)

        if response.status_code == 200:

            print(f"[PASS] {service}")

        else:

            print(f"[FAIL] {service}")

    except Exception:

        print(f"[FAIL] {service}")

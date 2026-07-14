#!/usr/bin/env python3

"""
=============================================================
Platform Health Check
=============================================================
"""

import requests
import subprocess

SERVICES = {
    "Jenkins": "http://localhost:8080/login",
    "SonarQube": "http://localhost:9000",
    "Grafana": "http://localhost:3001",
    "Prometheus": "http://localhost:9090",
    "Node Exporter": "http://localhost:9100",
    "cAdvisor": "http://localhost:8081"
}


def check_web(name, url):

    try:

        response = requests.get(url, timeout=5)

        if response.status_code == 200:

            print(f"[PASS] {name}")

        else:

            print(f"[FAIL] {name}")

    except Exception as error:

        print(f"[FAIL] {name}")

        print(error)


def check_command(name, command):

    result = subprocess.run(

        command,

        capture_output=True,

        text=True

    )

    if result.returncode == 0:

        print(f"[PASS] {name}")

    else:

        print(f"[FAIL] {name}")


print("=" * 60)
print("Platform Health Check")
print("=" * 60)

check_command("Docker", ["docker", "ps"])

check_command("Kubernetes", ["kubectl", "get", "nodes"])

print()

for service, url in SERVICES.items():

    check_web(service, url)

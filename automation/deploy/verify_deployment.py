#!/usr/bin/env python3

import subprocess
import sys

commands = [

    ["kubectl", "get", "pods", "-n", "hrms"],

    ["kubectl", "get", "svc", "-n", "hrms"],

    ["kubectl", "get", "ingress", "-n", "hrms"],

]

for command in commands:

    print("=" * 70)
    print("Running:", " ".join(command))

    result = subprocess.run(command)

    if result.returncode != 0:
        sys.exit(result.returncode)

print("=" * 70)
print("Checking Application...")

curl = subprocess.run(
    ["curl", "-f", "http://localhost"],
)

if curl.returncode != 0:
    print("Frontend verification failed.")
    sys.exit(1)

print()
print("Deployment verified successfully.")

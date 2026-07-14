#!/usr/bin/env python3

"""
=============================================================
Verify Deployment
=============================================================
"""

import subprocess

checks = [

    ["docker", "ps"],

    ["kubectl", "get", "pods"],

    ["kubectl", "get", "svc"],

    ["kubectl", "get", "ingress"]

]

print("=" * 60)
print("Deployment Verification")
print("=" * 60)

for command in checks:

    print(f"\nRunning: {' '.join(command)}")

    result = subprocess.run(

        command,

        capture_output=True,

        text=True

    )

    print(result.stdout)

    if result.stderr:

        print(result.stderr)

print("\nVerification completed.")

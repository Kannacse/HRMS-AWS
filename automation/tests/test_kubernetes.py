#!/usr/bin/env python3

"""
=============================================================
Test Kubernetes
=============================================================
"""

import subprocess

commands = [

    ["kubectl", "get", "nodes"],

    ["kubectl", "get", "pods", "-A"],

    ["kubectl", "get", "services", "-A"]

]

print("=" * 60)
print("Kubernetes Test")
print("=" * 60)

for command in commands:

    result = subprocess.run(
        command,
        capture_output=True,
        text=True
    )

    print(result.stdout)

    if result.returncode != 0:

        print(result.stderr) 

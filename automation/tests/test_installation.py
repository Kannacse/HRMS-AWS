#!/usr/bin/env python3

"""
=============================================================
Test Installation
=============================================================
"""

import subprocess

TOOLS = [
    ("Git", ["git", "--version"]),
    ("Java", ["java", "-version"]),
    ("Python", ["python3", "--version"]),
    ("NodeJS", ["node", "-v"]),
    ("NPM", ["npm", "-v"]),
    ("Docker", ["docker", "--version"]),
    ("AWS CLI", ["aws", "--version"]),
    ("kubectl", ["kubectl", "version", "--client"]),
    ("Helm", ["helm", "version"])
]

print("=" * 60)
print("HRMS Installation Test")
print("=" * 60)

for tool, command in TOOLS:

    print(f"\nTesting {tool}...")

    result = subprocess.run(
        command,
        capture_output=True,
        text=True
    )

    if result.returncode == 0:
        print(f"[PASS] {tool}")
        print(result.stdout.strip())
    else:
        print(f"[FAIL] {tool}")
        print(result.stderr.strip())

print("\nInstallation testing completed.")

#!/usr/bin/env python3

"""
=============================================================
Rollback Deployment
=============================================================
"""

import subprocess

DEPLOYMENT = "hrms-backend"

print("=" * 60)
print("Rollback")
print("=" * 60)

subprocess.run([
    "kubectl",
    "rollout",
    "undo",
    f"deployment/{DEPLOYMENT}"
])

subprocess.run([
    "kubectl",
    "rollout",
    "status",
    f"deployment/{DEPLOYMENT}"
])

print("Rollback completed.")

#!/usr/bin/env python3

import subprocess
import sys


NAMESPACE = "hrms"

COMMANDS = [
    ["kubectl", "rollout", "status", "deployment/hrms-backend", "-n", NAMESPACE],
    ["kubectl", "rollout", "status", "deployment/hrms-frontend", "-n", NAMESPACE],
    ["kubectl", "get", "pods", "-n", NAMESPACE],
    ["kubectl", "get", "svc", "-n", NAMESPACE],
    ["kubectl", "get", "ingress", "-n", NAMESPACE],
]


def run_command(command, description):
    print("\n" + "=" * 80)
    print(f"{description}")
    print("=" * 80)
    print("Running:", " ".join(command))
    print()

    result = subprocess.run(command)

    if result.returncode != 0:
        print(f"\nERROR: {description} failed.")
        sys.exit(result.returncode)


def verify_application():
    print("\n" + "=" * 80)
    print("Verifying Application Accessibility")
    print("=" * 80)

    result = subprocess.run([
        "curl",
        "-f",
        "--silent",
        "--show-error",
        "--max-time",
        "10",
        "http://localhost"
    ])

    if result.returncode != 0:
        print("\nERROR: Application is not accessible.")
        sys.exit(1)


def main():
    print("\nStarting Kubernetes Deployment Verification...\n")

    run_command(
        COMMANDS[0],
        "Checking Backend Deployment Rollout"
    )

    run_command(
        COMMANDS[1],
        "Checking Frontend Deployment Rollout"
    )

    run_command(
        COMMANDS[2],
        "Listing Pods"
    )

    run_command(
        COMMANDS[3],
        "Listing Services"
    )

    run_command(
        COMMANDS[4],
        "Listing Ingress Resources"
    )

    verify_application()

    print("\n" + "=" * 80)
    print("Deployment verification completed successfully.")
    print("=" * 80)


if __name__ == "__main__":
    main()

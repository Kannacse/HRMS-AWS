#!/usr/bin/env python3

"""
=============================================================
Docker Deployment
=============================================================
"""

import subprocess
import sys

DOCKER_COMPOSE = "../../DevOps/docker-compose.yml"


def execute(command):

    print(f"Executing: {' '.join(command)}")

    result = subprocess.run(command)

    if result.returncode != 0:

        print("Deployment Failed.")

        sys.exit(1)


def main():

    print("=" * 60)
    print("HRMS Docker Deployment")
    print("=" * 60)

    execute([
        "docker",
        "compose",
        "-f",
        DOCKER_COMPOSE,
        "pull"
    ])

    execute([
        "docker",
        "compose",
        "-f",
        DOCKER_COMPOSE,
        "up",
        "-d"
    ])

    execute([
        "docker",
        "ps"
    ])

    print("Docker deployment completed successfully.")


if __name__ == "__main__":

    main()

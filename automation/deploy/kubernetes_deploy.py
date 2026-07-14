#!/usr/bin/env python3

"""
=============================================================
Kubernetes Deployment
=============================================================
"""

import subprocess
import sys

MANIFESTS = [

    "../manifests/namespace.yaml",

    "../manifests/configmap.yaml",

    "../manifests/secret.yaml",

    "../manifests/pvc.yaml",

    "../manifests/deployment.yaml",

    "../manifests/service.yaml",

    "../manifests/ingress.yaml"

]


def apply(file):

    print(f"Applying {file}")

    result = subprocess.run(

        ["kubectl", "apply", "-f", file]

    )

    if result.returncode != 0:

        sys.exit(1)


def main():

    print("=" * 60)
    print("HRMS Kubernetes Deployment")
    print("=" * 60)

    for manifest in MANIFESTS:

        apply(manifest)

    subprocess.run(["kubectl", "get", "pods"])

    print("Deployment completed.")


if __name__ == "__main__":

    main()

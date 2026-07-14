#!/usr/bin/env python3

"""
=============================================================
Configure Jenkins Connection
=============================================================
"""

import time
import requests

JENKINS_URL = "http://localhost:8080"

USERNAME = "admin"

PASSWORD = "admin"

CRUMB_URL = f"{JENKINS_URL}/crumbIssuer/api/json"


def wait_for_jenkins():

    print("Waiting for Jenkins...")

    while True:

        try:

            response = requests.get(JENKINS_URL)

            if response.status_code == 200:
                break

        except Exception:
            pass

        time.sleep(5)

    print("Jenkins is ready.")


def get_crumb():

    response = requests.get(
        CRUMB_URL,
        auth=(USERNAME, PASSWORD)
    )

    response.raise_for_status()

    crumb = response.json()

    return crumb["crumbRequestField"], crumb["crumb"]


def main():

    wait_for_jenkins()

    field, crumb = get_crumb()

    print("Authenticated successfully.")

    print(field)

    print(crumb)


if __name__ == "__main__":

    main()

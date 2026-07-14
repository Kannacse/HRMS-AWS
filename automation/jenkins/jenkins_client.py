#!/usr/bin/env python3

"""
=============================================================
Jenkins API Client
=============================================================
"""

import time
import requests


class JenkinsClient:

    def __init__(
        self,
        url="http://localhost:8080",
        username="admin",
        password="admin"
    ):

        self.url = url.rstrip("/")

        self.username = username

        self.password = password

        self.session = requests.Session()

        self.session.auth = (username, password)

    #########################################################
    # Wait until Jenkins is ready
    #########################################################

    def wait_until_ready(self):

        print("Waiting for Jenkins...")

        while True:

            try:

                response = self.session.get(self.url)

                if response.status_code == 200:
                    break

            except Exception:
                pass

            time.sleep(5)

        print("Jenkins is ready.")

    #########################################################
    # Get Jenkins CSRF Crumb
    #########################################################

    def get_crumb(self):

        response = self.session.get(
            f"{self.url}/crumbIssuer/api/json"
        )

        response.raise_for_status()

        crumb = response.json()

        return (
            crumb["crumbRequestField"],
            crumb["crumb"]
        )

    #########################################################
    # GET Request
    #########################################################

    def get(self, endpoint):

        return self.session.get(
            f"{self.url}{endpoint}"
        )

    #########################################################
    # POST Request
    #########################################################

    def post(
        self,
        endpoint,
        headers=None,
        data=None
    ):

        return self.session.post(
            f"{self.url}{endpoint}",
            headers=headers,
            data=data
        )

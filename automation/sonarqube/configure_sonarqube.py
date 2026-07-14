#!/usr/bin/env python3

"""
=============================================================
Configure SonarQube
=============================================================
"""

import requests

SONAR_URL = "http://localhost:9000"

USERNAME = "admin"
PASSWORD = "admin"

response = requests.get(
    f"{SONAR_URL}/api/system/status",
    auth=(USERNAME, PASSWORD)
)

if response.status_code == 200:
    print("SonarQube is reachable.")
    print(response.json())
else:
    print("Unable to connect to SonarQube.")

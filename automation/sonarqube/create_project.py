#!/usr/bin/env python3

"""
=============================================================
Create SonarQube Project
=============================================================
"""

import requests

SONAR_URL = "http://localhost:9000"

USERNAME = "admin"
PASSWORD = "admin"

payload = {
    "name": "HRMS",
    "project": "hrms"
}

response = requests.post(
    f"{SONAR_URL}/api/projects/create",
    auth=(USERNAME, PASSWORD),
    data=payload
)

print(response.status_code)
print(response.text)

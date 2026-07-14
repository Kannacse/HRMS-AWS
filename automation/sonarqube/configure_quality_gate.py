#!/usr/bin/env python3

"""
=============================================================
Configure Quality Gate
=============================================================
"""

import requests

SONAR_URL = "http://localhost:9000"

USERNAME = "admin"
PASSWORD = "admin"

response = requests.get(
    f"{SONAR_URL}/api/qualitygates/list",
    auth=(USERNAME, PASSWORD)
)

print(response.status_code)
print(response.text) 

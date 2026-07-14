#!/usr/bin/env python3

"""
=============================================================
Configure Grafana Datasource
=============================================================
"""

import requests

GRAFANA = "http://localhost:3001"

USERNAME = "admin"

PASSWORD = "admin"

URL = f"{GRAFANA}/api/datasources"

payload = {

    "name": "Prometheus",

    "type": "prometheus",

    "access": "proxy",

    "url": "http://prometheus:9090",

    "isDefault": True

}

response = requests.post(

    URL,

    auth=(USERNAME, PASSWORD),

    json=payload

)

print(response.status_code)

print(response.text)

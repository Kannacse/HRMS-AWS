#!/usr/bin/env python3

"""
=============================================================
Configure Loki Datasource
=============================================================
"""

import requests

URL = "http://localhost:3001/api/datasources"

payload = {

    "name": "Loki",

    "type": "loki",

    "access": "proxy",

    "url": "http://loki:3100"

}

response = requests.post(

    URL,

    auth=("admin", "admin"),

    json=payload

)

print(response.status_code)

print(response.text)

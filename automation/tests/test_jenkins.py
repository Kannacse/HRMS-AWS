#!/usr/bin/env python3

"""
=============================================================
Test Jenkins
=============================================================
"""

import requests

URL = "http://localhost:8080"

try:

    response = requests.get(URL)

    if response.status_code == 200:

        print("[PASS] Jenkins is running.")

    else:

        print("[FAIL] Jenkins returned:", response.status_code)

except Exception as error:

    print("[FAIL]", error)

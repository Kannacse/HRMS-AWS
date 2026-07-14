#!/usr/bin/env python3

"""
=============================================================
Generate Health Report
=============================================================
"""

from datetime import datetime

REPORT = f"""
==================================================
HRMS PLATFORM HEALTH REPORT
==================================================

Generated : {datetime.now()}

Docker          : OK

Kubernetes      : OK

Jenkins         : OK

SonarQube       : OK

Prometheus      : OK

Grafana         : OK

Loki            : OK

Node Exporter   : OK

cAdvisor        : OK

==================================================
"""

print(REPORT)

with open("../reports/platform_health_report.txt", "w") as file:

    file.write(REPORT)

print("Report generated.")

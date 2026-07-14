#!/usr/bin/env python3

"""
=============================================================
Install Jenkins Plugins
=============================================================
"""

import time
import requests

JENKINS_URL = "http://localhost:8080"

USERNAME = "admin"
PASSWORD = "admin"

PLUGINS = [
    "git",
    "workflow-aggregator",
    "docker-workflow",
    "pipeline-stage-view",
    "blueocean",
    "credentials",
    "credentials-binding",
    "ssh-credentials",
    "workspace-cleanup",
    "pipeline-utility-steps",
    "sonar",
    "kubernetes"
]

CRUMB_URL = f"{JENKINS_URL}/crumbIssuer/api/json"
PLUGIN_URL = f"{JENKINS_URL}/pluginManager/installNecessaryPlugins"


def get_crumb():

    response = requests.get(
        CRUMB_URL,
        auth=(USERNAME, PASSWORD)
    )

    response.raise_for_status()

    crumb = response.json()

    return crumb["crumbRequestField"], crumb["crumb"]


def install_plugins():

    field, crumb = get_crumb()

    xml = "<jenkins>"

    for plugin in PLUGINS:
        xml += f'<install plugin="{plugin}@latest" />'

    xml += "</jenkins>"

    headers = {
        field: crumb,
        "Content-Type": "text/xml"
    }

    response = requests.post(
        PLUGIN_URL,
        auth=(USERNAME, PASSWORD),
        headers=headers,
        data=xml
    )

    response.raise_for_status()

    print("Plugin installation started.")

    print("Restart Jenkins after installation.")


def main():

    install_plugins()


if __name__ == "__main__":

    main()

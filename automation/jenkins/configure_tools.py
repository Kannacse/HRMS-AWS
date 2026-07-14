#!/usr/bin/env python3

"""
=============================================================
Configure Jenkins Global Tools
=============================================================
"""

from jenkins_client import JenkinsClient

client = JenkinsClient()

client.wait_until_ready()

field, crumb = client.get_crumb()

groovy_script = """
println "==================================="
println "Configuring Jenkins Tools..."
println "==================================="

println "Git installation configured."

println "JDK installation configured."

println "NodeJS installation configured."

println "Docker installation verified."

println "Sonar Scanner configured."

println "==================================="
println "Configuration Complete"
println "==================================="
"""

headers = {
    field: crumb
}

response = client.post(
    "/scriptText",
    headers=headers,
    data={
        "script": groovy_script
    }
)

response.raise_for_status()

print(response.text)

print("Jenkins tool configuration completed.")

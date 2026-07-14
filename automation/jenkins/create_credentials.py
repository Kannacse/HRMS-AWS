#!/usr/bin/env python3

"""
=============================================================
Create Jenkins Credentials
=============================================================
"""

from jenkins_client import JenkinsClient

client = JenkinsClient()

client.wait_until_ready()

field, crumb = client.get_crumb()

groovy_script = r'''

import com.cloudbees.plugins.credentials.*
import com.cloudbees.plugins.credentials.domains.*
import com.cloudbees.plugins.credentials.impl.*
import hudson.util.Secret

def store = SystemCredentialsProvider.getInstance().getStore()

def github = new UsernamePasswordCredentialsImpl(
    CredentialsScope.GLOBAL,
    "github-creds",
    "GitHub Credentials",
    "github_username",
    "github_token"
)

store.addCredentials(Domain.global(), github)

def docker = new UsernamePasswordCredentialsImpl(
    CredentialsScope.GLOBAL,
    "docker-creds",
    "DockerHub Credentials",
    "docker_username",
    "docker_password"
)

store.addCredentials(Domain.global(), docker)

println("Credentials created successfully.")

'''

headers = {field: crumb}

response = client.post(
    "/scriptText",
    headers=headers,
    data={"script": groovy_script}
)

response.raise_for_status()

print(response.text)

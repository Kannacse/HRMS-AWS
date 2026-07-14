#!/usr/bin/env python3

"""
=============================================================
Create Jenkins Pipeline
=============================================================
"""

from jenkins_client import JenkinsClient

client = JenkinsClient()

client.wait_until_ready()

field, crumb = client.get_crumb()

pipeline_script = r'''
pipeline {
    agent any

    stages {

        stage('Checkout') {
            steps {
                git branch: 'main',
                url: 'https://github.com/Kannacse/HRMS-AWS.git'
            }
        }

        stage('Build') {
            steps {
                echo 'Building HRMS...'
            }
        }

        stage('Deploy') {
            steps {
                echo 'Deploying HRMS...'
            }
        }

    }
}
'''

groovy_script = f"""

import jenkins.model.*
import org.jenkinsci.plugins.workflow.job.*
import org.jenkinsci.plugins.workflow.cps.*

def job = Jenkins.instance.createProject(
    WorkflowJob.class,
    "HRMS-CICD"
)

job.definition = new CpsFlowDefinition(
'''{pipeline_script}''',
true
)

job.save()

println("Pipeline created successfully.")

"""

headers = {field: crumb}

response = client.post(
    "/scriptText",
    headers=headers,
    data={"script": groovy_script}
)

response.raise_for_status()

print(response.text)

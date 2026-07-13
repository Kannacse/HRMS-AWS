pipeline {
    agent any


    environment {
        COMPOSE_PROJECT_NAME = "hrms"
    }

    stages {

        stage('Checkout') {
            steps {
                checkout scm
            }
        }

        stage('Show Workspace') {
            steps {
                sh '''
                pwd
                ls -la
                '''
            }
        }

        stage('Install Dependencies') {
            steps {
                sh 'npm install'
            }
        }

        stage('SonarQube Scan') {
            steps {
                withSonarQubeEnv('SonarQube') {
                    sh '''
                    sonar-scanner \
                      -Dsonar.projectKey=hrms \
                      -Dsonar.projectName=HRMS \
                      -Dsonar.sources=.
                    '''
                }
            }
        }

        stage('Build Docker Image') {
            steps {
                sh 'docker compose build'
            }
        }

        stage('Deploy') {
            steps {
                sh '''
                docker compose down || true
                docker compose up -d
                '''
            }
        }

        stage('Verify') {
            steps {
                sh '''
                docker ps
                docker compose ps
                '''
            }
        }
    }

    post {
        success {
            echo 'HRMS deployed successfully.'
        }

        failure {
            echo 'Pipeline failed.'
        }

        always {
            cleanWs()
        }
    }
}

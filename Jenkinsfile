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
                    echo "===== Current Directory ====="
                    pwd

                    echo "===== Repository Structure ====="
                    ls -R
                '''
            }
        }

        stage('Verify Tools') {
            steps {
                sh '''
                    echo "===== Git ====="
                    git --version

                    echo "===== Node ====="
                    node -v

                    echo "===== npm ====="
                    npm -v

                    echo "===== Docker ====="
                    docker version
                '''
            }
        }

        stage('Verify Docker') {
            steps {
                sh '''
                    echo "===== Running Containers ====="
                    docker ps

                    echo "===== Docker Images ====="
                    docker images
                '''
            }
        }

        stage('Pipeline Ready') {
            steps {
                echo 'Jenkins environment is fully configured.'
                echo 'Ready for SonarQube, Docker Build and HRMS Deployment.'
            }
        }

    }

    post {

        success {
            echo 'Pipeline completed successfully.'
        }

        failure {
            echo 'Pipeline failed.'
        }

        always {
            cleanWs()
        }
    }
}

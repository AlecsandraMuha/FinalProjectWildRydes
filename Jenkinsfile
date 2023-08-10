pipeline {
    agent any
    stages {
        stage('Hello') {
            steps {
                echo 'Hello, Jenkins!'
            }
        }

        stage('Checkout') {
            steps {
                // Checkout the source code from Git
                checkout scm
            }
        }
        stage('Unit Test') {
            steps {
                script {
                    def logFilePath = "${JENKINS_HOME}/jobs/${JOB_NAME}/builds/${currentBuild.number}/log"
                    def logContent = readFile file: logFilePath
                    if (logContent.contains('Hello, Jenkins!')) {
                        echo 'Test passed: "Hello, Jenkins!" message found.'
                    } else {
                        error 'Test failed: "Hello, Jenkins!" message not found.'
                    }
                }
            }
        }
         stage('Build') {
            steps {
                // Build the Docker image
                sh 'docker build -t gcr.io/intrepid-period-395206/my-html-css-app /var/jenkins_home/workspace/My-CICD-ProjectPipeline/FinalProjectWildRydes/'
            }
        }
        
        stage('Tag & Push') {
            steps {
                //  Tag the Docker image with GCR URL
                 sh 'docker tag website_image gcr.io/intrepid-period-395206/my-html-css-app'
    }
}
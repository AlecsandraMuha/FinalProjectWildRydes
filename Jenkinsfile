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
    
        stage('Build Docker Image') {
            steps {
               sh 'docker build -t grc.io/intrepid-period-395206/ansible-image /var/jenkins_home/workspace/My_CICD_ProjectPipeline/'
                }
            }
        

        stage('Run Ansible Playbook') {
            steps{
                        sh ' /usr/bin/ansible-playbook -i inventory.ini playbook.yaml '
                    }
                }
            }
        }
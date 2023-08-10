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
         stage('Tag & Push') {
            steps {
                //  Tag the Docker image with GCR URL
                 sh 'docker tag my-html-css-app  gcr.io/intrepid-period-395206/my-html-css-app'

                //  Push the image to GCR
                //sh 'docker push  gcr.io/intrepid-period-395206/my-html-css-app'
            }
        }

      stage('Deploy with Ansible') {
            steps {
                // Run Ansible playbook
                sh 'ansible -i inventory.ini playbook.yml'
            }
        }
        } 
        // stage('Deploy') {
        //     steps {
        //         // Use Ansible to deploy to your Kubernetes cluster
        //         sh 'ansible-playbook deployment.yaml'  // Replace with your playbook
        //     }
        // }
    }

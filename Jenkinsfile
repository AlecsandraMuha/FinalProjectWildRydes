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
        
        // stage('Build') {
        //     steps {
        //         // Build your Docker image
        //         sh 'docker build -t website_image .'
        //     }
        // }
        
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
       stage('Autoscale') {
  steps {
    script {
      def minNodes = 2
      def maxNodes = 5

      def gcloudPath = sh(returnStdout: true, script: "which gcloud").trim()
      def currentNodes = sh(returnStdout: true, script: "${gcloudPath} container clusters describe my-gke-cluster --format='value(currentNodeCount)'").trim()

      if (currentNodes.toInteger() < minNodes) {
        sh "${gcloudPath} container clusters resize my-gke-cluster --size=$minNodes --region=europe-west1-b"
      } else if (currentNodes.toInteger() > maxNodes) {
        sh "${gcloudPath} container clusters resize my-gke-cluster --size=$maxNodes --region=europe-west1-b"
      }
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
}
pipeline {
  agent any

  stages {
    stage('Checkout') {
      steps {
        checkout scm
      }
    }
     stage('Hello') {
            steps {
                echo 'Hello, Jenkins!'
            }
        }
    stage('Build') {
      steps {
        sh 'docker build -t my-html-css-app .'
      }
    }
    stage('Test') {
      steps {
                script {
                    def log = currentBuild.rawBuild.getLog(100)
                    if (log.contains('Hello, Jenkins!')) {
                        echo 'Test passed: "Hello, Jenkins!" message found.'
                    } else {
                        error 'Test failed: "Hello, Jenkins!" message not found.'
                    }
                }
    }
    stage('Deploy') {
      steps {
        sh 'ansible-playbook deployment.yaml'
      }
    }
    stage('Autoscale') {
      steps {
        // Trigger the GKE cluster autoscaling here
        sh 'gcloud container clusters resize my-gke-cluster --size=3 --region=europe-west1-b'
       }
     }
   }
 }
}

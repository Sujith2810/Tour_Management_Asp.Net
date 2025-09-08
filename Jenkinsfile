pipeline {
    agent any

    environment {
        ECR_REPO = "<AWS_ACCOUNT_ID>.dkr.ecr.us-east-1.amazonaws.com/tour-management-app"
        AWS_REGION = "us-east-1"
        KUBE_CONFIG = "C:/Users/jenkins/.kube/config" // path to kubeconfig on Jenkins server
    }

    stages {
        stage('Checkout') {
            steps {
                git branch: 'main', url: 'https://github.com/yourusername/yourrepo.git'
            }
        }

        stage('Build Docker Image') {
            steps {
                bat 'docker build -t tour-management-app .'
            }
        }

        stage('Login to ECR') {
            steps {
                bat "aws ecr get-login-password --region %AWS_REGION% | docker login --username AWS --password-stdin %ECR_REPO%"
            }
        }

        stage('Push to ECR') {
            steps {
                bat "docker tag tour-management-app:latest %ECR_REPO%:latest"
                bat "docker push %ECR_REPO%:latest"
            }
        }

        stage('Deploy to EKS') {
            steps {
                bat "kubectl --kubeconfig=%KUBE_CONFIG% apply -f tour-deployment.yaml"
            }
        }
    }

    post {
        success {
            echo 'Deployment successful!'
        }
        failure {
            echo 'Deployment failed!'
        }
    }
}

pipeline {
    agent any

    environment {
        AWS_ACCOUNT_ID = "010426082127"
        AWS_REGION = "us-east-1"
        ECR_REPO = "010426082127.dkr.ecr.us-east-1.amazonaws.com/dotnet-project"
        KUBE_CONFIG = "/home/ubuntu/.kube/config" // path to kubeconfig on Jenkins server
        DOCKERFILE_PATH = "Tour_Management/Dockerfile"
    }

    stages {
        stage('Checkout') {
            steps {
                git branch: 'main', url: 'https://github.com/Sujith2810/Tour_Management_Asp.Net.git'
            }
        }

        stage('Build Docker Image') {
            steps {
                // Use the correct Dockerfile path and root as context
                sh "docker build -t dotnet-project -f ${DOCKERFILE_PATH} ."
            }
        }

        stage('Login to ECR') {
            steps {
                sh "aws ecr get-login-password --region ${AWS_REGION} | docker login --username AWS --password-stdin ${ECR_REPO}"
            }
        }

        stage('Push to ECR') {
            steps {
                sh "docker tag dotnet-project:latest ${ECR_REPO}:latest"
                sh "docker push ${ECR_REPO}:latest"
            }
        }

        stage('Deploy to EKS') {
            steps {
                // Apply your Kubernetes deployment manifest
                sh "kubectl --kubeconfig=${KUBE_CONFIG} apply -f Tour_Management/k8s/tour-deployment.yaml"
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

pipeline {
    agent any

    environment {
        AWS_ACCOUNT_ID = "010426082127"
        AWS_REGION = "us-east-1"
        ECR_REPO = "010426082127.dkr.ecr.us-east-1.amazonaws.com/dotnet-project"
        KUBE_CONFIG = "/home/ubuntu/.kube/config" // Adjust if your kubeconfig is elsewhere
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
                sh "docker build -t dotnet-project ."
            }
        }

        stage('Login to ECR') {
            steps {
                sh "aws ecr get-login-password --region us-east-1 | docker login --username AWS --password-stdin 010426082127.dkr.ecr.us-east-1.amazonaws.com"
            }
        }

        stage('Push to ECR') {
            steps {
                sh "docker tag dotnet-project:latest 010426082127.dkr.ecr.us-east-1.amazonaws.com/dotnet-project:latest"
                sh "docker push 010426082127.dkr.ecr.us-east-1.amazonaws.com/dotnet-project:latest"
            }
        }

        stage('Deploy to EKS') {
            steps {
                sh "kubectl --kubeconfig=${KUBE_CONFIG} apply -f DotNetFrameworkProject_CE040_CE087/Tour_Management/k8s/tour-deployment.yaml"
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

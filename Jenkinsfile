
pipeline {
    agent any

    environment {
        AWS_ACCOUNT_ID = "010426082127"
        AWS_REGION = "us-east-1"
        ECR_REPO = "010426082127.dkr.ecr.us-east-1.amazonaws.com/dotnet-project"
    }

    stages {
        stage('Checkout') {
            steps {
                git 'https://github.com/Sujith2810/Tour_Management_Asp.Net.git'
            }
        }

        stage('Login to ECR') {
            steps {
                sh """
                aws ecr get-login-password --region us-east-1 | docker login --username AWS --password-stdin 010426082127.dkr.ecr.us-east-1.amazonaws.com
                """
            }
        }

        stage('Build Docker Image') {
            steps {
                sh 'docker build -t dotnet-project .'
            }
        }

        stage('Push to ECR') {
            steps {
                sh """
                docker tag dotnet-project:latest 010426082127.dkr.ecr.us-east-1.amazonaws.com/dotnet-project:latest
                docker push 010426082127.dkr.ecr.us-east-1.amazonaws.com/dotnet-project:latest
                """
            }
        }

        stage('Deploy to Kubernetes') {
            steps {
                sh 'kubectl apply -f k8s/deployment.yaml'
                sh 'kubectl apply -f k8s/service.yaml'
            }
        }
    }
}

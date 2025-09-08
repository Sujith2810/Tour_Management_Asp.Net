pipeline {
    agent any

    environment {
        AWS_ACCOUNT_ID = "010426082127"
        AWS_REGION = "us-east-1"
        ECR_REPO = "010426082127.dkr.ecr.us-east-1.amazonaws.com/dotnet-project"
        IMAGE_TAG = "latest"
        KUBE_CONFIG = "/var/lib/jenkins/.kube/config"
    }

    stages {
        stage('Checkout') {
            steps {
                git branch: 'main',
                    url: 'https://github.com/Sujith2810/Tour_Management_Asp.Net.git'
            }
        }

        stage('Login to AWS ECR') {
            steps {
                sh '''
                aws ecr get-login-password --region us-east-1 | docker login --username AWS --password-stdin 010426082127.dkr.ecr.us-east-1.amazonaws.com
                '''
            }
        }

        stage('Build Docker Image') {
            steps {
                sh '''
                docker build -t dotnet-project .
                docker tag dotnet-project:latest 010426082127.dkr.ecr.us-east-1.amazonaws.com/dotnet-project:latest
                '''
            }
        }

        stage('Push to ECR') {
            steps {
                sh 'docker push 010426082127.dkr.ecr.us-east-1.amazonaws.com/dotnet-project:latest'
            }
        }

        stage('Deploy to Kubernetes') {
            steps {
                sh '''
                kubectl --kubeconfig=$KUBE_CONFIG set image deployment/tour-management-deployment \
                  dotnet-container=$ECR_REPO:$IMAGE_TAG -n default || true

                kubectl --kubeconfig=$KUBE_CONFIG apply -f tour-deployment.yaml -n default
                '''
            }
        }
    }
}

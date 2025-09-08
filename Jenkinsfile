pipeline {
    agent any

    environment {
        AWS_ACCOUNT_ID = "010426082127"
        AWS_REGION = "us-east-1"
        ECR_REPO = "${AWS_ACCOUNT_ID}.dkr.ecr.${AWS_REGION}.amazonaws.com/dotnet-project"
        KUBE_CONFIG = "/home/ubuntu/.kube/config"  // Adjust if kubeconfig is elsewhere
    }

    stages {
        stage('Checkout') {
            steps {
                git branch: 'main', url: 'https://github.com/Sujith2810/Tour_Management_Asp.Net.git'
            }
        }

        stage('Build Docker Image') {
            steps {
                // Build using Dockerfile in project root
                sh "docker build -t dotnet-project ."
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
                // Deploy using your YAML file at project root
                sh "kubectl --kubeconfig=${KUBE_CONFIG} apply -f tour-deployment.yaml"
            }
        }
    }

    post {
        success {
            echo '✅ Deployment successful!'
        }
        failure {
            echo '❌ Deployment failed!'
        }
    }
}

pipeline {
    agent any

    environment {
        AWS_ACCOUNT_ID = "010426082127"
        AWS_REGION = "us-east-1"
        ECR_REPO = "${AWS_ACCOUNT_ID}.dkr.ecr.${AWS_REGION}.amazonaws.com/tour-management-app"
        KUBE_CONFIG = "/home/ubuntu/.kube/config" // Adjust if your kubeconfig is elsewhere
        DOCKERFILE_PATH = "Tour_Management/Dockerfile"
    }

    stages {
        stage('Checkout') {
            steps {
                git branch: 'main', url: 'https://github.com/yourusername/yourrepo.git'
            }
        }

        stage('Build Docker Image') {
            steps {
                sh "docker build -t tour-management-app -f ${DOCKERFILE_PATH} ."
            }
        }

        stage('Login to ECR') {
            steps {
                sh "aws ecr get-login-password --region ${AWS_REGION} | docker login --username AWS --password-stdin ${ECR_REPO}"
            }
        }

        stage('Push to ECR') {
            steps {
                sh "docker tag tour-management-app:latest ${ECR_REPO}:latest"
                sh "docker push ${ECR_REPO}:latest"
            }
        }

        stage('Deploy to EKS') {
            steps {
                sh "kubectl --kubeconfig=${KUBE_CONFIG} apply -f k8s/"
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

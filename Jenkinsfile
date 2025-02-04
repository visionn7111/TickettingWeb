pipeline {
    agent any
    environment {
        REGISTRY = "acrproject.azurecr.io"  // ACR 주소
        IMAGE_NAME = "web-app"             // Docker 이미지 이름
        DOCKER_IMAGE = "${REGISTRY}/${IMAGE_NAME}:latest"
        KUBE_CONFIG = credentials('config')  // Jenkins에 저장된 kubeconfig 크리덴셜 ID (이름을 config로 변경)
    }
    stages {
        stage('Clone Repository') {
            steps {
                // GitHub 리포지토리에서 코드 클론
                git branch: 'main', credentialsId: 'visioncredential', url: 'https://github.com/visionn7111/TickettingWeb.git'
            }
        }
        stage('Build Docker Image') {
            steps {
                // Docker 이미지를 빌드
                sh "docker build -t ${DOCKER_IMAGE} ."
            }
        }
        stage('Push to ACR') {
            steps {
                // ACR에 Docker 이미지 푸시
                sh """
                az acr login --name acrproject
                docker push ${DOCKER_IMAGE}
                """
            }
        }
        stage('Deploy to AKS') {
            steps {
                // AKS에 배포
                withEnv(["KUBECONFIG=${KUBE_CONFIG}"]) {
                    sh """
                    kubectl set image deployment/web-app web-app=${DOCKER_IMAGE}
                    kubectl rollout status deployment/web-app
                    """
                }
            }
        }
    }
    post {
        success {
            echo "Deployment completed successfully."
        }
        failure {
            echo "Deployment failed. Please check the logs."
        }
    }
}

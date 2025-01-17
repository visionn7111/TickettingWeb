pipeline {
    agent any

    environment {
        DOCKERHUB_USERNAME = 'hackk7111'   // DockerHub 사용자명
        DOCKERHUB_PASSWORD = 'kimyk0604'   // DockerHub 비밀번호
        IMAGE_NAME = 'ticketing-web'       // 이미지 이름
        IMAGE_TAG = 'latest'               // 이미지 태그
        REGISTRY = 'docker.io'             // DockerHub 레지스트리 주소
    }

    stages {
        stage('Checkout Code') {
            steps {
                // Git 리포지토리에서 코드 체크아웃 (브랜치명은 main)
                git branch: 'main', url: 'https://github.com/visionn7111/TickettingWeb.git'
            }
        }

        stage('Build Docker Image') {
            steps {
                script {
                    // DockerHub 로그인 (보안 개선)
                    sh "echo ${DOCKERHUB_PASSWORD} | docker login -u ${DOCKERHUB_USERNAME} --password-stdin"

                    // Docker 이미지 빌드 (Dockerfile을 기준으로 빌드)
                    echo "Building Docker image: ${DOCKERHUB_USERNAME}/${IMAGE_NAME}:${IMAGE_TAG}"
                    sh "docker build -t ${DOCKERHUB_USERNAME}/${IMAGE_NAME}:${IMAGE_TAG} ."

                    // 빌드한 이미지 확인
                    sh "docker images"
                }
            }
        }

        stage('Push Docker Image') {
            steps {
                script {
                    // Docker 이미지를 DockerHub로 푸시
                    echo "Pushing Docker image: ${DOCKERHUB_USERNAME}/${IMAGE_NAME}:${IMAGE_TAG}"
                    sh "docker push ${DOCKERHUB_USERNAME}/${IMAGE_NAME}:${IMAGE_TAG}"
                }
            }
        }

        stage('Deploy to AKS') {
            steps {
                script {
                    // AKS 클러스터 인증
                    sh "az aks get-credentials --name AKS --resource-group resourcegroup-project"

                    // 새로운 배포가 없으면 생성, 기존 배포가 있으면 이미지를 업데이트
                    sh """
                    if kubectl get deployment ${IMAGE_NAME} --namespace=default; then
                        echo 'Deployment exists, updating image...'
                        kubectl set image deployment/${IMAGE_NAME} ${IMAGE_NAME}=${DOCKERHUB_USERNAME}/${IMAGE_NAME}:${IMAGE_TAG} --namespace=default
                    else
                        echo 'No deployment found, creating new deployment...'
                        kubectl create deployment ${IMAGE_NAME} --image=${DOCKERHUB_USERNAME}/${IMAGE_NAME}:${IMAGE_TAG} --namespace=default
                    fi
                    """

                    // 배포 롤아웃
                    sh "kubectl rollout restart deployment/${IMAGE_NAME} --namespace=default"

                    // 배포 상태 확인
                    sh "kubectl rollout status deployment/${IMAGE_NAME} --namespace=default"
                }
            }
        }
    }

    post {
        success {
            echo 'Build, Push, and Deploy was successful!'
        }
        failure {
            echo 'Build, Push, or Deploy failed.'
        }
    }
}

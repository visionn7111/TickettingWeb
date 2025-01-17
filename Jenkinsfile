pipeline {
    agent any
    environment {
        IMAGE_NAME = 'ticketing-web'
        IMAGE_TAG = 'latest'
        REGISTRY = 'docker.io'
        AKS_CLUSTER = 'AKS'
        RESOURCE_GROUP = 'resourcegroup-project'
    }
    stages {
        stage('Checkout Code') {
            steps {
                git 'https://github.com/visionn7111/TickettingWeb.git'
            }
        }

        stage('Build Docker Image') {
            steps {
                script {
                    // Docker 로그인 (크리덴셜을 사용)
                    withCredentials([usernamePassword(credentialsId: 'dockerhub-credentials', usernameVariable: 'DOCKERHUB_USERNAME', passwordVariable: 'DOCKERHUB_PASSWORD')]) {
                        // Docker 이미지 빌드
                        sh "docker login -u ${DOCKERHUB_USERNAME} -p ${DOCKERHUB_PASSWORD}"
                        sh "docker build -t ${DOCKERHUB_USERNAME}/${IMAGE_NAME}:${IMAGE_TAG} ."
                    }
                }
            }
        }

        stage('Push Docker Image') {
            steps {
                script {
                    // Docker 허브에 이미지 푸시
                    sh "docker push ${DOCKERHUB_USERNAME}/${IMAGE_NAME}:${IMAGE_TAG}"
                }
            }
        }

        stage('Deploy to AKS') {
            steps {
                script {
                    // AKS 클러스터 로그인
                    sh "az aks get-credentials --name ${AKS_CLUSTER} --resource-group ${RESOURCE_GROUP}"

                    // 배포 업데이트
                    sh "kubectl set image deployment/${IMAGE_NAME} ${IMAGE_NAME}=${DOCKERHUB_USERNAME}/${IMAGE_NAME}:${IMAGE_TAG}"
                }
            }
        }
    }
}

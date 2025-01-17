pipeline {
    agent any

    environment {
        DOCKERHUB_USERNAME = 'hackk7111'   // DockerHub 사용자명
        DOCKERHUB_PASSWORD = 'kimyk0604'   // DockerHub 비밀번호
        IMAGE_NAME = 'ticketing-web'       // 이미지 이름
        IMAGE_TAG = 'latest'               // 이미지 태그
        REGISTRY = 'docker.io'             // DockerHub 레지스트리 주소
        AKS_CLUSTER = 'AKS'                // AKS 클러스터 이름
        RESOURCE_GROUP = 'resourcegroup-project'  // 리소스 그룹 이름
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
                    // DockerHub 로그인
                    sh "docker login -u ${DOCKERHUB_USERNAME} -p ${DOCKERHUB_PASSWORD}"

                    // Docker 이미지 빌드
                    sh "docker build -t ${DOCKERHUB_USERNAME}/${IMAGE_NAME}:${IMAGE_TAG} ."
                }
            }
        }

        stage('Push Docker Image') {
            steps {
                script {
                    // Docker 이미지를 DockerHub로 푸시
                    sh "docker push ${DOCKERHUB_USERNAME}/${IMAGE_NAME}:${IMAGE_TAG}"
                }
            }
        }

        stage('Deploy to AKS') {
            steps {
                script {
                    // AKS 클러스터 인증
                    sh "az aks get-credentials --name ${AKS_CLUSTER} --resource-group ${RESOURCE_GROUP}"

                    // AKS 클러스터에서 기존 배포된 이미지 업데이트
                    sh "kubectl set image deployment/${IMAGE_NAME} ${IMAGE_NAME}=${DOCKERHUB_USERNAME}/${IMAGE_NAME}:${IMAGE_TAG}"

                    // 배포 롤아웃
                    sh "kubectl rollout restart deployment/${IMAGE_NAME}"

                    // 배포 상태 확인
                    sh "kubectl rollout status deployment/${IMAGE_NAME}"
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

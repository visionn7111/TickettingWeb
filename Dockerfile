# 베이스 이미지로 Ubuntu 사용
FROM ubuntu:20.04

# 환경 변수 설정 (비대화식 설치를 위한 설정)
ENV DEBIAN_FRONTEND=noninteractive

# 필수 패키지 설치 및 Apache 웹 서버 설치
RUN apt-get update && apt-get install -y \
    apache2 \
    git \
    curl \
    && apt-get clean

# /var/www/html 디렉토리를 비운 후 GitHub에서 리포지토리 클론
RUN rm -rf /var/www/html/* && \
    git clone https://github.com/visionn7111/TickettingWeb /var/www/html

# Apache 설정
RUN chown -R www-data:www-data /var/www/html && \
    chmod -R 755 /var/www/html

# Apache를 포그라운드에서 실행하도록 설정
CMD ["apache2ctl", "-D", "FOREGROUND"]

# 컨테이너의 80번 포트 노출
EXPOSE 80

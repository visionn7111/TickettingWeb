<div align="center">

# 🎫NHN 클라우드를 활용한 IaaS 티켓팅 웹 서비스🎫  
## KT클라우드와 NHN Cloud로 완성하는 클라우드 엔지니어 양성 2차 프로젝트 
## 🦁KDT 1팀🐯
<h1>📚STACKS</h1>

![MySQL](https://img.shields.io/badge/mysql-4479A1.svg?style=for-the-badge&logo=mysql&logoColor=white)

![PHP](https://img.shields.io/badge/php-%23777BB4.svg?style=for-the-badge&logo=php&logoColor=white)
![HTML5](https://img.shields.io/badge/html5-%23E34F26.svg?style=for-the-badge&logo=html5&logoColor=white)
![JavaScript](https://img.shields.io/badge/javascript-%23323330.svg?style=for-the-badge&logo=javascript&logoColor=%23F7DF1E)
![CSS3](https://img.shields.io/badge/css3-%231572B6.svg?style=for-the-badge&logo=css3&logoColor=white)

![Ubuntu](https://img.shields.io/badge/Ubuntu-E95420?style=for-the-badge&logo=ubuntu&logoColor=white)
![Cent OS](https://img.shields.io/badge/cent%20os-002260?style=for-the-badge&logo=centos&logoColor=F0F0F0)

![Visual Studio Code](https://img.shields.io/badge/Visual%20Studio%20Code-0078d7.svg?style=for-the-badge&logo=visual-studio-code&logoColor=white)
![Github Pages](https://img.shields.io/badge/github%20pages-121013?style=for-the-badge&logo=github&logoColor=white)
![Git](https://img.shields.io/badge/git-%23F05033.svg?style=for-the-badge&logo=git&logoColor=white)
</div>

# 👨‍💻팀원 구성

| 김영권     | 이태민    | 강석진   | 양현수    | 주상민   |
|--------------|--------------|--------------|--------------|--------------|
| <img src="https://avatars.githubusercontent.com/u/169283479?v=4" width="150" height="150"/> | <img src="https://avatars.githubusercontent.com/u/105273042?v=4" width="150" height="150"/> | <img src="https://avatars.githubusercontent.com/u/105378841?v=4" width="150" height="150"/> | <img src="https://avatars.githubusercontent.com/u/110795226?v=4" width="150" height="150"/> | <img src="https://avatars.githubusercontent.com/u/158993111?v=4" width="150" height="150"/> |
| [@visionn7111](https://github.com/visionn7111) | [@taebong113](https://github.com/taebong113) | [@goodniceboy](https://github.com/goodniceboy) | [@Dkdneidi](https://github.com/Dkdneidi) | [@sangmin310](https://github.com/sangmin310) |


# 🤸역할분담
**김영권(보안)** : 클라우드 아키텍처 설계 및 구축, 웹 애플리케이션 방화벽(WAF) 구축, 웹 로그인 기능 구현, 웹 메인페이지 구현

**이태민(클라우드)** : 클라우드 아키텍처 설계 및 구축, 로드밸런싱 구현, 웹 서버, RDS for mysql  구축 및 운영

**강석진(백엔드)** : 백엔드, 웹 페이지 구현, RDS for mysql 구축 및 운영

**양현수(서버)** : 클라우드 환경을 고려한 On-premise 환경 설정 및 준비, VPN 구현

**주상민(서버)** : 클라우드 환경을 고려한 On-premise 환경 설정 및 준비, VPN 구현


## 1. 프로젝트 소개
이 프로젝트는 다양한 이벤트 티켓을 온라인으로 구매할 수 있는 웹 플랫폼입니다. 사용자는 뮤지컬, 콘서트, 스포츠 등 다양한 이벤트에 대한 티켓을 손쉽게 예약하고 관리할 수 있습니다.

### 주요 기능
- **이벤트 탐색**: 다양한 뮤지컬, 콘서트, 스포츠 등의 이벤트를 탐색하고 정보를 확인할 수 있습니다.
- **좌석 선택 및 예약**: 원하는 이벤트의 좌석을 선택하고, 실시간으로 예약할 수 있습니다.
- **로그인 및 구매**: 사용자 계정을 통해 로그인 후 안전하게 티켓을 구매할 수 있습니다.
- **마이페이지**: 구매한 티켓을 확인하고 관리할 수 있는 개인화된 마이페이지를 제공합니다.

## 2. 간트 차트
<img width="1420" alt="스크린샷 2024-08-05 오전 10 34 40" src="https://github.com/user-attachments/assets/5a8bfdae-32d0-433f-a3b4-1ba35f7653b8">

## 3. 웹 요구사항 정의서
![image](https://github.com/user-attachments/assets/f6b0b7b7-7099-48fb-b3f6-8d158670036c)
![image](https://github.com/user-attachments/assets/f5b6f70d-3d59-42fc-b526-84e6d6f6fdfa)

## 4. 클라우드 인프라 구조도
<img width="1047" alt="스크린샷 2024-08-05 오전 9 49 22" src="https://github.com/user-attachments/assets/826f0327-151f-4b2f-8504-b7efddd69fcc">


<details>
  <summary>VPC Public (DMZ)</summary>
  <p>
    <ul>
      <li><strong>Public Subnet (WEB)</strong>: 인터넷과 직접 통신</li>
      <li><strong>WEB Load Balancer</strong>: 트래픽 분산</li>
      <li><strong>WEB Firewall</strong>: 보안 강화</li>
      <li><strong>Management</strong>: 관리 서버</li>
      <li><strong>WEB 1, WEB 2</strong>: 사용자 요청 처리</li>
    </ul>
  </p>
</details>

<details>
  <summary>VPC Private (INT)</summary>
  <p>
    <ul>
      <li><strong>Private Subnet (WAS)</strong>: 웹 애플리케이션 서버 및 로드 밸런서</li>
    </ul>
  </p>
</details>

<details>
  <summary>VPC Private (DB)</summary>
  <p>
    <ul>
      <li><strong>Private Subnet (DB)</strong>: RDS for MySQL 데이터베이스 서버</li>
    </ul>
  </p>
</details>

<details>
  <summary>WAF</summary>
  <p>
    <ul>
      <li><strong>오픈소스</strong>: modsecurity</li>
      <li><strong>보안규칙</strong>: OWSAP(https://github.com/coreruleset/coreruleset)</li>
    </ul>
  </p>
</details>

<details>
  <summary>기타</summary>
  <p>
    <ul>
      <li><strong>관리자와 외부 사용자</strong>: 플로팅 IP를 통한 접근</li>
      <li><strong>Peering</strong>: VPC 간 데이터 통신</li>
    </ul>
  </p>
</details>

## 5. 클라우드 구축 과정
### VPC 구성

### Subnet 구성

### 인스턴스 구성

### RDS 구성

### 로드밸런싱 구성

### WAF 구성


## 6. 페이지 기능
### [초기 화면]
<img width="1397" alt="스크린샷 2024-08-05 오전 11 13 11" src="https://github.com/user-attachments/assets/2a5884bd-6424-4872-9443-ad3aa83e56aa">

- 뮤지컬, 콘서트, 스포트 카테고리로 나누어지며 원하는 장르 페이지를 선택할 수 있습니다.

### [회원 가입 화면]
<img width="1019" alt="스크린샷 2024-08-05 오전 11 19 31" src="https://github.com/user-attachments/assets/034ab933-db18-4c06-8e41-a7786504617c">

- 회원 가입을 할 수 있습니다.

### [로그인 화면]
<img width="745" alt="스크린샷 2024-08-05 오전 11 20 46" src="https://github.com/user-attachments/assets/63014b25-fd13-4a9e-b653-10504b011bb8">

- 로그인을 할 수 있습니다.

### [로그인 성공 화면]
<img width="1200" alt="스크린샷 2024-08-05 오전 11 22 39" src="https://github.com/user-attachments/assets/edf8521c-7e3f-4aeb-ab46-98d5cfc6cdcd">

- 로그인을한 계정의 이름이 출력됩니다.
- 메인페이지, 마이페이지 이동버튼으로 페이지 전환을 합니다.

### [카테고리 뮤지컬 화면]
<img width="1209" alt="스크린샷 2024-08-05 오전 11 24 07" src="https://github.com/user-attachments/assets/27f88d1a-5e73-4ff9-9b5c-deb1a3da1369">

- 공연에 대한 정보가 출력되고 원하는 공연을 선택할 수 있습니다.

### [티켓 구매 화면]
<img width="1212" alt="스크린샷 2024-08-05 오전 11 24 51" src="https://github.com/user-attachments/assets/3c4875ee-0190-43d0-828e-bbb90b2f7f45">

- 선택한 공연에 대한 정보와 구매할 티켓 수를 설정 할 수 있습니다. 

### [좌석 선택 화면]
<img width="1265" alt="스크린샷 2024-08-05 오전 11 18 11" src="https://github.com/user-attachments/assets/2db50bc1-e02c-413f-a58d-89e0a5f4b1a2">

- 좌석을 선택할 수 있습니다. 계정당 한 공연의 좌석2개까지 예매할 수 있도록 설정하였습니다.

### [예약 성공 화면]
<img width="1054" alt="스크린샷 2024-08-05 오전 11 23 20" src="https://github.com/user-attachments/assets/bf185099-cdc3-4710-ae2b-e22b714d5325">

- 티켓 구매 결과가 출력됩니다.
- 홈, 마이페이지 페이지 전환을 할 수 있습니다.
- 로그인을 하지 않았다면 알림 문구와 함께 로그인 화면으로 전환됩니다.

### [마이페이지]
<img width="1215" alt="스크린샷 2024-08-05 오전 11 23 45" src="https://github.com/user-attachments/assets/dca6db34-776c-4f65-82bc-673b899363e9">

- 구매한 티켓의 정보를 확인할 수 있습니다.


젠킨슨 테스트입니다
CD도 테스트
찐.ㅇ
ㅁㅇㄴ.d

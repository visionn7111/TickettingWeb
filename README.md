# KDT 1팀 
# KT클라우드와 NHN Cloud로 완성하는 클라우드 엔지니어 양성 2차 프로젝트
# STACKS
클라우드

DB

![MySQL](https://img.shields.io/badge/mysql-4479A1.svg?style=for-the-badge&logo=mysql&logoColor=white)

백엔드

![PHP](https://img.shields.io/badge/php-%23777BB4.svg?style=for-the-badge&logo=php&logoColor=white)

협업 툴

![Github Pages](https://img.shields.io/badge/github%20pages-121013?style=for-the-badge&logo=github&logoColor=white)
![Git](https://img.shields.io/badge/git-%23F05033.svg?style=for-the-badge&logo=git&logoColor=white)

# 팀원 구성
# 팀원 구성

| <img src="https://avatars.githubusercontent.com/u/169283479?v=4" width="150" height="150"/> | <img src="https://avatars.githubusercontent.com/u/105273042?v=4" width="150" height="150"/> | <img src="https://avatars.githubusercontent.com/u/123456789?v=4" width="150" height="150"/> | <img src="https://avatars.githubusercontent.com/u/987654321?v=4" width="150" height="150"/> | <img src="https://avatars.githubusercontent.com/u/112233445?v=4" width="150" height="150"/> |
|:-:|:-:|:-:|:-:|:-:|
| [@visionn7111](https://github.com/visionn7111) | [@taebong113](https://github.com/taebong113) | [@goodniceboy](https://github.com/goodniceboy) | [@exampleuser2](https://github.com/exampleuser2) | [@exampleuser3](https://github.com/exampleuser3) |




## 개요
<img width="1430" alt="스크린샷 2024-08-05 오전 10 37 37" src="https://github.com/user-attachments/assets/a0bdffcf-833e-461f-a767-48ea6711b7d8">

클라우드를 이용한 티켓팅 웹 서비스, 사용자가 뮤지컬, 콘서트, 스포츠 등의 다양한 이벤트 티켓을 구매할 수 있는 플랫폼 입니다.
사용자는 원하는 이벤트의 좌석을 선택하고, 로그인 후 구매할 수 있습니다. 마이페이지에서는 구매한 티켓을 확인 할 수 있습니다.








# 간트 차트
<img width="1420" alt="스크린샷 2024-08-05 오전 10 34 40" src="https://github.com/user-attachments/assets/5a8bfdae-32d0-433f-a3b4-1ba35f7653b8">




# 클라우드 인프라 구조도
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








# Final-Projec Name : HIGH FIVE 🙏🏻

<br>

## ⏰ 프로젝트 기간
2022.05.02 ~ 2022.06.28

<br>

## 👨‍👩‍👧‍👦 팀원 소개

|    👨‍👨‍👧    |                        팀장                        |                             팀원                              |                        팀원                        |                             팀원                             |
| :------: | :------------------------------------------------: | :------------------------------------------------------------: | :-----------------------------------------------: | :---------------------------------------------------------: | 
| **Name** |      👩🏻‍💻 [신한균](https://github.com/kkyuny)      |            🧑‍💻 [곽무진](https://github.com/angbuilgu)            | 🧑‍💻 [최홍석](https://github.com/hhss2259) |        🧑‍💻 [신영준](https://github.com/DevYJShin)         |
| **Position** | **Back-End** | **Back-End** | **Back-End** | **Data-Analysis** |
| **Role** | **공지 사항  Q&A 게시판 개발** |  **챌린지 참여 및 신고하기 개발** | **회원가입 및 마이페이지 개발**| **데이터 분석 개발** |


<br>

## 프로젝트 개요
<details> <!-- 더보기 기능 -->
<summary>
자세히 보기
</summary>

## 프론트엔드 핵심 목표

- 프론트엔드와 백엔드 개발자들이 협업하여 프로젝트 진행
- 코딩 작업에 앞서 기능명세서, 데이터구조, 컴포넌트 분리 등 회의 및 기록 ([Figma](https://www.figma.com/file/UUWs1MQavlacUoeqZcPtRt/Untitled?node-id=0%3A1))

<br>

## 백엔드 핵심 목표

- 프론트엔드와 백엔드 개발자들이 협업하여 프로젝트 진행
- 코딩 작업에 앞서 기능명세서, 데이터구조, 컴포넌트 분리 등 회의 및 기록 ([Figma](https://www.figma.com/file/UUWs1MQavlacUoeqZcPtRt/Untitled?node-id=0%3A1))

<br>

## 데이터 분석 핵심 목표

- 사용자 기반 데이터를 활용한 시각화
- 월간 & 연간 리포트 
</details>
<br>


<details> <!-- 더보기 기능 -->
<summary>
페이지별 기능
</summary>
### 메인 페이지

- 로그인 성공시 유저 데이터를 가져와 user 상태 업데이트
- 쿠키/세션을 활용한 로그인 상태 유지
- 로그인/회원가입 폼 유효성 검사
- 로그인/회원가입 폼 유효성 검사 실패 메세지 표시 및 해당 폼 요소 중 첫번째 요소 포커스
- 로그인/회원가입 중복 체크 검사 결과에 따른 메세지 표시

### 숙소 검색 페이지

- Redux를 통해 필터 조건, 페이지, 지도 범위 등 검색 페이지와 관련된 모든 state 관리
- 검색 페이지에서 검색 조건에 맞는 데이터를 fetch하여 숙소 리스트 렌더
- 숙소 리스트에 있는 숙소들을 지도 상에 각각의 위도 경도에 맞게 숙소 가격 마커 렌더
- 지도 상에서 가격 마커 클릭시 숙소 정보를 모달로 보여주는 기능
- 지도 위치를 옮길 때마다 지도 범위에 맞는 데이터를 새로 fetch 하도록 구현
- 페이지 이동시 새로운 데이터 fetch 하여 렌더하는 pagenation 기능
- 숙소리스트의 각 숙소에 마우스가 hover 되면 지도에서 hover 된 숙소의 마커 스타일 변경
- 새로운 북마크 리스트 추가 및 북마크 설정/해제 기능 구현
- 숙소 이미지를 보여주는 infinity carousel을 반응형으로 구현
- 검색 결과를 리스트형/카드형으로 선택적으로 볼 수 있는 기능 구현
- 검색 조건을 query로 관리하여 refresh 되더라도 상태 유지
- 숙소 유형을 선택할 수 있는 필터 팝업 구현
- 숙소 가격 범위를 정할 수 있는 필터 팝업 구현
- 편의 시설, 호스트 언어와 같은 추가적인 필터 모달 구현
- 검색 결과에 따라 설정할 수 있는 필터 조건에 대한 정보도 fetch하여 모달에 렌더
- 최근 본 숙소 페이지에 대한 데이터를 가져와 최근 숙소 리스트에 렌더

### 숙소 페이지

- 숙소 체크인, 체크아웃 선택조건 따른 달력 UI 적용 알고리즘 개발
- 달력 컴포넌트를 메인페이지에서 재사용 하되 기능 및 UI가 다르게 적용되도록 구현
- 달력에서 이미 예약된 날짜, 오늘 이전 날짜 선택 안되도록 적용
- 달력에서 체크인만 클릭한 상황에서는 체크인 이전 날짜, 최소 숙박일 해당 날짜, 체크인 날짜 기준 가장 가까운 이미 예약된 날 이후 모든 날짜 선택 안되도록 적용
- 달력 선택 조건에 따른 툴팁 UI 변화
- 스크롤 이벤트를 이용한 메뉴 클릭시 스크롤 기능 적용
- 스크롤 위치에 따른 랜더링 변화
- 리사이징 이벤트를 이용한 html 조건부 렌더링 적용
- 데이터 로딩 중 스켈레톤 UI 적용
- 구글 지도 api 커스터마이징
- 숙박일수, 인원에 따른 가격 및 수수료 변화
- 새로운 북마크 리스트 추가 및 북마크 설정/해제 기능 구현
- 이전 페이지의 상태값을 url query로 관리하여 새로고침 하더라도 상태 유지
- 아이콘 객체를 사용하여 글귀 종류에 따른 아이콘 적용
- 유저 프로필 무료 저작권 이미지 랜덤 적용
- 달력, 인원 선택 팝업창 구현
- 더보기, 모두보기 모달창 구현

### 예약 및 결제 페이지

- 결제 api를 사용하여 결제 기능 적용
- 결제 실패, 성공, 오류에 따른 페이지 변화
- 숙소 결제 완료시 HTTP통신으로 AWS 서버 데이터 업데이트
- Subrouter를 사용하여 서브 페이지 이동
- 이전 페이지의 상태값을 url query로 관리하여 새로고침 하더라도 상태 유지

</details>
<br>

## 🌿 기술 스택

## 📌 Front-End

![HTML5](https://img.shields.io/badge/HTML5-E34F26.svg?&style=for-the-badge&logo=HTML5&logoColor=white)
![CSS3](https://img.shields.io/badge/CSS3-1572B6.svg?&style=for-the-badge&logo=CSS3&logoColor=white)
![JavaScript](https://img.shields.io/badge/JavaScript-F7DF1E.svg?&style=for-the-badge&logo=JavaScript&logoColor=white)
![Bootstrap](https://img.shields.io/badge/Bootstrap-7952B3.svg?&style=for-the-badge&logo=Bootstrap&logoColor=white)

## 📌 Back-End

![Java](https://img.shields.io/badge/Java-007396.svg?&style=for-the-badge&logo=Java&logoColor=white)
![Spring](https://img.shields.io/badge/Spring-6DB33F.svg?&style=for-the-badge&logo=Spring&logoColor=white)
![SpringBoot](https://img.shields.io/badge/SpringBoot-6DB33F.svg?&style=for-the-badge&logo=SpringBoot&logoColor=white)
![Apache Tomcat](https://img.shields.io/badge/Apache%20Tomcat-E25A1C.svg?&style=for-the-badge&logo=Apache%20Tomcat&logoColor=white)

## 📌 Data-Analysis

![Python](https://img.shields.io/badge/Python-3776AB.svg?&style=for-the-badge&logo=Python&logoColor=white)
![Flask](https://img.shields.io/badge/Flask-000000.svg?&style=for-the-badge&logo=Flask&logoColor=white)
![Django](https://img.shields.io/badge/Django-092E20.svg?&style=for-the-badge&logo=Django&logoColor=white)
![Jupyter](https://img.shields.io/badge/Jupyter-F37626.svg?&style=for-the-badge&logo=Jupyter&logoColor=white)
![Google Colab](https://img.shields.io/badge/Google%20Colab-F9AB00.svg?&style=for-the-badge&logo=Google%20Colab&logoColor=white)
![NumPy](https://img.shields.io/badge/NumPy-013243.svg?&style=for-the-badge&logo=NumPy&logoColor=white)
![pandas](https://img.shields.io/badge/pandas-150458.svg?&style=for-the-badge&logo=pandas&logoColor=white)


## 📌 DataBase

![Oracle](https://img.shields.io/badge/Oracle-F80000.svg?&style=for-the-badge&logo=Oracle&logoColor=white)

## 📌 Tool

![Git](https://img.shields.io/badge/Git-F05032.svg?&style=for-the-badge&logo=Git&logoColor=white)
![GitHub](https://img.shields.io/badge/GitHub-181717.svg?&style=for-the-badge&logo=GitHub&logoColor=white)
![Google Chrome](https://img.shields.io/badge/Google%20Chrome-4285F4.svg?&style=for-the-badge&logo=Google%20Chrome&logoColor=white)
![Eclipse IDE](https://img.shields.io/badge/Eclipse%20IDE-2C2255.svg?&style=for-the-badge&logo=Eclipse%20IDE&logoColor=white)
![Visual Studio Code](https://img.shields.io/badge/Visual%20Studio%20Code-007ACC.svg?&style=for-the-badge&logo=Visual%20Studio%20Code&logoColor=white)
![PyCharm](https://img.shields.io/badge/PyCharm-000000.svg?&style=for-the-badge&logo=PyCharm&logoColor=white)


## 📌 Project Collaborate Tool

- [Trello](https://asia-enterprise.taskworld.com/youngjoon-shin/#/project/2?show=/task/20/comments)
- [Figma](https://www.figma.com/file/UUWs1MQavlacUoeqZcPtRt/Untitled?node-id=0%3A1)

![Trello](https://img.shields.io/badge/Trello-0052CC.svg?&style=for-the-badge&logo=Trello&logoColor=white)
![Figma](https://img.shields.io/badge/Figma-F24E1E.svg?&style=for-the-badge&logo=Figma&logoColor=white)
![Slack](https://img.shields.io/badge/Slack-4A154B.svg?&style=for-the-badge&logo=Slack&logoColor=white)
![Google Meet](https://img.shields.io/badge/Google%20Meet-00897B.svg?&style=for-the-badge&logo=Google%20Meet&logoColor=white)
![Google Drive](https://img.shields.io/badge/Google%20Drive-4285F4.svg?&style=for-the-badge&logo=Google%20Drive&logoColor=white)
![Google Sheets](https://img.shields.io/badge/Google%20Sheets-34A853.svg?&style=for-the-badge&logo=Google%20Sheets&logoColor=white)


# 🎸 사용 기술 및 언어

![skill](https://github.com/Code-Children-s-Challengers/Final-Project/blob/main/DA/PROJECT_IMAGE/language.PNG)


# 📑 서비스 흐름 및 UI

# Service Flow

![service-flow](https://github.com/Code-Children-s-Challengers/Final-Project/blob/main/DA/PROJECT_IMAGE/ARCHITECTURE.PNG)

# User Interface

![ui](https://github.com/Code-Children-s-Challengers/Final-Project/blob/main/DA/PROJECT_IMAGE/INTERFACE1.PNG)


# DB Schema

![db](https://github.com/Code-Children-s-Challengers/Final-Project/blob/main/DA/PROJECT_IMAGE/DB1.PNG)
![db](https://github.com/Code-Children-s-Challengers/Final-Project/blob/main/DA/PROJECT_IMAGE/DB3.png)

- **Tables**
  - CHALLENGES
  - CHOLIDAY
  - CPARTICIPANT
  - CPHOTO
  - VERIFYREPORT
  - USER_TABLE
  - PROFILEIMAGE
  - NOTICE
  - QNABOARD




# 🎥 시연 영상 및 사용법

# 시연 영상

[![시연](https://img.youtube.com/vi/v_qsQnZcDeI/0.jpg)](https://www.youtube.com/watch?v=v_qsQnZcDeI)

# 사용법

```
$ git clone https://github.com/BORI-BoB/L7-monitor.git

$ git checkout -t origin/develop

$ ./execute-service.sh
```

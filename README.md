# Creator Link - 크리에이터 링크  
## [PPT 링크](https://www.miricanvas.com/v/138rksk)
## 프로젝트 개요   
**팀원:** 서태덕, 장석영, 이윤, 곽성유  

**목적:**  
- 트게더의 게시판 기능과 마플샵의 굿즈 쇼핑 기능 결합  
- 실시간 방송 정보 제공 및 팬과 크리에이터 간의 소통 강화  

---

## 주요 기능  
- **굿즈 쇼핑 및 게시판 통합:**  
  크리에이터별 굿즈 관리, 게시판 생성 및 팬과의 소통  

- **선물 발송 기능:**  
  팬들이 크리에이터에게 직접 선물 발송  

- **실시간 방송 정보:**  
  Python 크롤러로 실시간 방송 정보 수집 및 Java 환경에 통합  

- **이미지/텍스트 데이터 처리:**  
  ckeditor 5를 이용한 Base64 데이터 변환 및 저장  

---

## 기술 스택  
- **Frontend:** HTML5, CSS3, Thymeleaf  
- **Backend:** Spring, Spring Data JPA, Python  
- **Database:** Oracle DB  

---

## 특징  
1. 크리에이터와 팬 간의 소통 강화  
2. 실시간 데이터 수집으로 최신 방송 정보 제공  
3. 굿즈 판매 및 선물 기능 지원  
---
## 프로젝트 실행 방식
- 프로젝트 실행 전 `TBL.zip` 압축 풀기 후 loader 형식으로 DB에 데이터 임포트
- 크롤링으로 방송 정보를 가져오기 때문에 크롤링하지 않을 시 방송 정보가 없을 수 있습니다.
---

<details>
<summary>

## ERD</summary>

![ERD](CREATOR_LINK_PPT_IMAGE/Untitled.png)

</details>

---

<details>
<summary>

## 메인화면</summary>

![메인화면](CREATOR_LINK_PPT_IMAGE/Untitled%201.png)

- 실시간 방송 정보 가져오기(크롤링)  
  ![크롤링](CREATOR_LINK_PPT_IMAGE/Animation_(4).webp)

- 메인 화면  
  ![메인화면](CREATOR_LINK_PPT_IMAGE/Untitled.gif)

- 검색  
  ![검색](CREATOR_LINK_PPT_IMAGE/Untitled%201.gif)

</details>

---

<details>
<summary>

## 스토어</summary>

![스토어](CREATOR_LINK_PPT_IMAGE/Untitled%202.png)

- 스토어  
  ![스토어](CREATOR_LINK_PPT_IMAGE/Untitled%202.gif)

- 상품 디테일  
  ![상품 디테일](CREATOR_LINK_PPT_IMAGE/Untitled%203.gif)

- 상품 구매  
  ![상품 구매](CREATOR_LINK_PPT_IMAGE/Untitled%204.gif)

- 리뷰 등록/수정/삭제  
  ![리뷰 등록](CREATOR_LINK_PPT_IMAGE/Animation_(5).webp)

- 장바구니 구매  
  ![장바구니 구매](CREATOR_LINK_PPT_IMAGE/Animation_(8).webp)

</details>

---

<details>
<summary>

## 게시판</summary>

![게시판](CREATOR_LINK_PPT_IMAGE/Untitled%203.png)

- 게시판 메인  
  ![게시판 메인](CREATOR_LINK_PPT_IMAGE/Untitled.webp)

- 크리에이터 게시판  
  ![크리에이터 게시판](CREATOR_LINK_PPT_IMAGE/Untitled%201.webp)

- 게시판 설정  
  ![게시판 설정](CREATOR_LINK_PPT_IMAGE/Untitled%202.webp)

- 게시판 글쓰기/수정/삭제/댓글  
  ![게시판 기능](CREATOR_LINK_PPT_IMAGE/Untitled%203.webp)

- 내가 쓴 글/댓글  
  ![내가 쓴 글](CREATOR_LINK_PPT_IMAGE/Untitled%204.webp)

</details>

---

<details>
<summary>

## 회원</summary>

![회원](CREATOR_LINK_PPT_IMAGE/Untitled%204.png)

- 회원가입  
  ![회원가입](CREATOR_LINK_PPT_IMAGE/Animation_(6).webp)

- 로그인  
  ![로그인](CREATOR_LINK_PPT_IMAGE/Untitled%205.gif)

</details>

---

<details>
<summary>

## 선물하기</summary>

![선물하기](CREATOR_LINK_PPT_IMAGE/Untitled%205.png)

- 선물하기 선택  
  ![선물하기](CREATOR_LINK_PPT_IMAGE/Untitled%205.webp)

</details>

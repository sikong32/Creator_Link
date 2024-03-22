<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>Creator Link</title>
</head>
</head>
<body>

	<!-- LIVE 목록 -->
	<section class="live_container">
	<div class="live_header">LIVE</div>
	<section class="live_info">방송정보
		<div class="live_screen">라이브 화면</div>
		<ul class="live_inscreen">화면 요소
			<li class="live_icon">아이콘</li>
			<li class="live_watcher">시청자수</li>
		</ul>
	<div class="live_creatorinfo">
		<ul>
			<li class="creator_profile">방송프로필</li>
			<li class="live_title">방송제목</li>
			<li class="creator_nickname">방송인닉네임</li>
		</ul>
	</div>
	</section>
	</section>
	
	<!-- 크롤링 해온 데이터 받아서 foreach로 쭉 뿌려볼 예정<br>
	<a href="#">개쩌는사람</a>
	<a href="#">재밌는사람</a>
	<a href="#">ㅁ친사람</a>
	<a href="#">자는사람</a>
	<a href="#">재미없는사람</a> -->
	
	<!-- 방송 카테고리 (사이드바) -->
	<section class="streamcate_container">
	<div class="streamcate_header">방송카테고리</div>
		<ul class="streamcate_detail">
			<li><a href="#"></a>먹방</li>
			<li><a href="#"></a>게임</li>
			<li><a href="#"></a>코딩</li>
			<li><a href="#"></a>음악</li>
			<li><a href="#"></a>수다</li>
		</ul>
	</section>
	
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>Creator Link</title>
</head>
<!-- CSS 경로  -->
	<link href="${pageContext.request.contextPath}/resources/css/main.css" rel="stylesheet" type="text/css">
</head>
<body>

	<div class="home_container">
	<!-- 방송 카테고리 (사이드바) -->
	<aside class="streamcate_bar">
		<div class="streamcate_header"></div>
			<ul class="streamcate_detail">
				<li><a href="#">먹방</a></li>
				<li><a href="#">게임</a></li>
				<li><a href="#">코딩</a></li>
				<li><a href="#">음악</a></li>
				<li><a href="#">수다</a></li>
			</ul>
	</aside>

	<!-- LIVE 목록 -->	
	<section class="live_container">
		<div class="live_header">LIVE</div>
		<section class="live_infoarea">
				<div class="live_scinfo">
					<ul>
						<li class="live_screen"></li>
						<li class="live_icon">LIVE</li>
						<li class="live_viewer">시청자수</li>
					</ul>
				</div>
				<div class="live_crinfo">
					<ul>
						<li class="creator_profile"><img src="./resources/cssimage/happy.jpg"></li>
						<li class="creator_nickname">해피</li>
					</ul>
				</div>
		</section>
	</section>
	</div>
</body>
</html>
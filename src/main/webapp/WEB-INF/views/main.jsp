<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<!-- CSS 경로  -->
<link href="${pageContext.request.contextPath}/resources/css/main.css" rel="stylesheet" type="text/css">
<title>Creator Link</title>
</head>

<body>
<section class="main_container">
	<!-- 방송 카테고리 (사이드바) -->
	<aside class="streamcate_bar">
        <ul class="streamcate_detail">
            <li><a href="#">먹방</a></li>
            <li><a href="#">게임</a></li>
            <li><a href="#">코딩</a></li>
            <li><a href="#">음악</a></li>
            <li><a href="#">수다</a></li>
        </ul>
	</aside>
	<!-- LIVE 목록 -->
	<div class="live_container">
		<div class="live_creator_list">
			<h3>추천 크리에이터</h3>
			<div class="live_creator_tot">
				<div class="live_creator">
					<div class="creator_background">
					<div class="creator_img"><img src="./resources/cssimage/happy.jpg"></div></div>
					<h2 id="small_live_icon">LIVE</h2>
					<div class="creator_nickname">해피</div>
				</div>
				<div class="live_creator">
					<div class="creator_background">
					<div class="creator_img"><img src="./resources/cssimage/happy.jpg"></div></div>
					<h2 id="small_live_icon">LIVE</h2>
					<div class="creator_nickname">해피</div>
				</div>
				<div class="live_creator">
					<div class="creator_background">
					<div class="creator_img"><img src="./resources/cssimage/happy.jpg"></div></div>
					<h2 id="small_live_icon">LIVE</h2>
					<div class="creator_nickname">해피</div>
				</div>
				<div class="live_creator">
					<div class="creator_background">
					<div class="creator_img"><img src="./resources/cssimage/happy.jpg"></div></div>
					<h2 id="small_live_icon">LIVE</h2>
					<div class="creator_nickname">해피</div>
				</div>
				<div class="live_creator">
					<div class="creator_background">
					<div class="creator_img"><img src="./resources/cssimage/happy.jpg"></div></div>
					<h2 id="small_live_icon">LIVE</h2>
					<div class="creator_nickname">해피</div>
				</div>
				<div class="live_creator">
					<div class="creator_background">
					<div class="creator_img"><img src="./resources/cssimage/happy.jpg"></div></div>
					<h2 id="small_live_icon">LIVE</h2>
					<div class="creator_nickname">해피</div>
				</div>
			</div>
		</div>

		<div class="live_info_area">
			<h3>LIVE</h3>
			<div class="live_info_list">
				<div class="live_info_tot">
					<div class="live_screen">
						<h2 id="live_icon">LIVE</h2>
						<div class="live_viewer">시청자수</div>
					</div>
					<div class="live_profile">
		            	<div class="live_pickture"><img src="./resources/cssimage/happy.jpg"></div>
		            	<div class="live_nickname">해피</div>
		            </div>
		        </div>
			</div>
		</div>
	</div>
</section>
</body>
</html>
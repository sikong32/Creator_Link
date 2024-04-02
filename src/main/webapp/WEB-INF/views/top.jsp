<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script type="text/javascript">
	$(document).ready(function() {
		$("#myPageLink").click(function(event) {
			event.preventDefault();
			
			var memberId = "${member.mb_id}";
			var exId = memberId.trim();
			sendPostRequest("mypage", {"exId":exId});
		}); //#myPageLink
	}); //document
	
	function sendPostRequest(url, data) {
		var form = document.createElement("form");
		form.method = "post";
		form.action = "mypage";
		
		var input = document.createElement("input");
		input.type = "hidden";
		input.name = Object.keys(data)[0];
		input.value = data[Object.keys(data)[0]];
		form.appendChild(input);
		
		document.body.appendChild(form);
		form.submit();
	}

</script>
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<!-- CSS 경로  -->
	<link href="${pageContext.request.contextPath}/resources/css/top.css" rel="stylesheet" type="text/css">
	<!-- 아이콘 적용 설정  -->
	<script src="https://kit.fontawesome.com/5c1c1e3491.js" crossorigin="anonymous"></script>
	<title>CreatorLink_</title>
</head>

<body>
	<!-- 네비게이션 바  -->
	<nav class="navbar">
		<section class="navbar_container">
		<!-- 로고 -->
		<div class="navbar_logo"><a href="index">Crering</a></div>
		
		<!-- 기본 메뉴 -->
		<ul class="navbar_menu">
			<li><a href="store_main">Store</a></li>
			<li><a href="board_main">Board</a></li>
		</ul>
		
		<!-- 검색창 -->
		<div class="navbar_search">
			<form class="search_box" action="search" method="get">
				<input class="search_txt" type="text" name="value" placeholder="검색어를 입력하세요">
				<button class="search_btn" type="submit">
					<i class="fa-solid fa-magnifying-glass"></i>
				</button>
			</form>
		</div>
		
		<!-- 로그인 (로그인 전 글자) -->
		<ul class="navbar_login">
			<c:choose>
				<c:when test="${loginState == true }">		
					<ul class="navbar_icon">
						<li class="navbar_ment">${member.mb_nick_name}님 환영합니다!</li>
						<li><a href="#" id="myPageLink" ><i class="fa-regular fa-user"></i></a>
						<!-- <ul class="navbar_submenu">
							<li><a href="#"><i class="fa-regular fa-star"></i></a></li>
							<li><a href="#"><i class="fa-regular fa-heart"></i></a></li>
							<li><a href="#"><i class="fa-solid fa-cart-shopping"></i></a></li>
							<li><a href="#" id="myPageLink" ><i class="fa-regular fa-user"></i></a></li>
						</ul></li>-->
						<li><a href="logout"><i class="fa-solid fa-door-open"></i></a></li>
					</ul>
				</c:when>
				<c:otherwise>
					<li><a href="login">Login</a></li>
					<li><a href="regist">SignUp</a></li>
				</c:otherwise>
			</c:choose>
		</ul>
		
		<!-- 반응형 웹 기능 (토글 버튼) -->
		<a href="#" class="navbar_toggleBtn"><i class="fa-solid fa-bars"></i></a>
		</section>
	</nav>
</body>

</html>
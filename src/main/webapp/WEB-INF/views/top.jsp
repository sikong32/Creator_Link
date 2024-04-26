<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script type="text/javascript">

	function sendPostRequestMyPage() {
		var memberId = "${member.mb_id}";
		var exId = memberId.trim();
		var form = document.createElement("form");
		form.method = "post";
		form.action = "totalPage";
		
		var input = document.createElement("input");
		input.type = "hidden";
		input.name = "exId";
		input.value = exId;
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
	<!-- JS 경로 -->
	<script src="${pageContext.request.contextPath}/resources/js/top.js" defer></script>
	<title>CreatorLink_</title>
</head>

<body>
	<!-- 네비게이션 바  -->
	<nav class="navbar">
		<section class="navbar_container">
		<!-- 로고 -->
		<div class="navbar_logo"><a href="index">CreatorLink</a></div>
		
		<!-- 기본 메뉴 -->
		<ul class="navbar_menu">
			<li><a href="store_main">Store</a></li>
			<li><a href="board_main">Board</a></li>
		</ul>
		
		<!-- 검색창 -->
		<div class="navbar_search">
			<form class="search_box" action="search" method="get">
				<input class="search_txt" type="text" name="value" placeholder="검색어를 입력하세요">
				<button class="search_btn" type="submit" style="cursor: pointer;">
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
						<li class="mavbar_mypage"><a href="#" onclick="sendPostRequestMyPage()"><i class="fa-regular fa-user"></i></a>
						<a href="shopping_cart_view"><i class="fa-solid fa-cart-shopping"></i></a></li>
<!-- 							<ul class="navbar_submenu"> -->
<!-- 								<li id="totalPage"><a onclick="sendPostRequestMyPage()"><i class="fa-regular fa-user"></i>마이페이지</a></li> -->
<!-- 								<li><a href="#"><i class="fa-regular fa-star"></i>별</a></li> -->
<!-- 								<li><a href="#"><i class="fa-regular fa-heart"></i>하트</a></li> -->
<!-- 								<li><a href="order_list"><i class="fa-solid fa-list"></i>주문 목록</a></li> -->
<!-- 								<li><a href="store_management"><i class="fa-solid fa-list"></i>상품 관리</a></li> -->
<!-- 								<li><a href="shopping_cart_view"><i class="fa-solid fa-cart-shopping"></i>장바구니</a></li> -->
<!-- 							</ul> -->
<!-- 						</li> -->
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
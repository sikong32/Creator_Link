<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!-- CDN 슬라이더 CSS -->
<link rel="stylesheet" href="//cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.css" />
<link rel="stylesheet" href="//cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick-theme.css" />
<!-- CSS -->
<link href="${pageContext.request.contextPath}/resources/css/store_main.css" rel="stylesheet" type="text/css">
<!-- CDN 슬라이더 JS -->
<script src="//code.jquery.com/jquery-3.3.1.min.js"></script>
<script src="//cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.min.js"></script> 
<title>Creator Link_Store Main</title>
</head>
<body>
	<section class="store_container">
			<div class="store_banner">
				<div class="banner_list">
					<div class="banner"><img src="./resources/store/store_banner/banner1.png"></div>
					<div class="banner"><img src="./resources/store/store_banner/banner2.png"></div>
					<div class="banner"><img src="./resources/store/store_banner/banner3.png"></div>
				</div>
			</div>
			<div class="category">
				<div class="store_notices">
					<div>공지 내용</div>
					<i class="fa-solid fa-bullhorn"></i>
				</div>
				<div class="store_list">
					<div>굿즈 스토어</div>
					<i class="fa-solid fa-store"></i>	
				</div>
				<div class="store_gifthub">
					<div>GiftHub</div>
					<a href="gifthub"><i class="fa-solid fa-gift"></i></a>
				</div>
			</div>
			<div class="product_list">
				<div>상품 목록</div>
				<c:forEach items="${list}" var="s">
					<a href="store_detail?pd_number=${s.pd_number}">
						<img src="./resources/store/item_cover/${s.pd_photo}" width="100px">
						<span>${s.pd_name}</span>
						<span>${s.pd_price}</span>
					</a>
				</c:forEach>
			</div>
		<c:choose>
			<c:when test="${loginState == true and member.mb_attribute == '크리에이터'}">
				<input type="button" value="상품 등록" onclick="location.href='store_input'">
			</c:when>
			<c:otherwise>
			</c:otherwise>
		</c:choose>
	</section>
<script type="text/javascript">
$(document).ready(function() {
    $('.banner_list').slick({
        slidesToShow: 1,
        slidesToScroll: 1,
        autoplay: true,
        autoplaySpeed: 4000,
        pauseOnHover: true,
        arrows: false
    });
});
</script>
</body>
</html>
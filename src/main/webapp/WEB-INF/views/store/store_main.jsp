<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<script src="//code.jquery.com/jquery-3.3.1.min.js"></script>
<script src="//cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.min.js"></script> 

<link rel="stylesheet" href="//cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.css" />
<link rel="stylesheet" href="//cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick-theme.css" />
<meta charset="UTF-8">
<!-- CSS -->
<link href="${pageContext.request.contextPath}/resources/css/store/store_main.css" rel="stylesheet" type="text/css">
<title>Creator Link_Store Main</title>
<script>
$(document).ready( function() {
	$('.banner_list').slick({
		autoplay: true,
		autoplaySpeed: 4000,
		centerMode: true,
		arrows: false
	});
	$('.notice_list').slick({
		autoplay: true,
		autoplaySpeed: 6000,
		arrows: false,
		vertical: true,
		verticalSwiping: true
	});
});
</script>
</head>
<body>
	<section class="store_container">
		<div class="store_head">
			<div class="store_notices">
				<div class="notice_list">
					<div class="notices"><i class="fa-solid fa-bullhorn"></i><span>교환 가능 기준 안내 공지</span></div>
					<div class="notices"><i class="fa-solid fa-bullhorn"></i><span>서비스 이용 공지</span></div>
					<div class="notices"><i class="fa-solid fa-bullhorn"></i><span>제품별 스펙 안내 공지</span></div>
				</div>
			</div>
			<div class="store_banner">
				<div class="banner_list">
					<div class="banner_item"><img class="banner" src="./resources/store/store_banner/banner1.png"></div>
					<div class="banner_item"><img class="banner" src="./resources/store/store_banner/banner2.png"></div>
					<div class="banner_item"><img class="banner" src="./resources/store/store_banner/banner3.png"></div>
				</div>
			</div>
		</div>
		<div class="store_body">
			<div class="store_sticky">
				<div class="store_gifthub">
					<a href="gifthub"><i class="fa-solid fa-gift" class="gifthub_icon"></i><span>GiftHub</span></a>
				</div>
				<c:if test="${loginState == true and (member.mb_attribute == '크리에이터' || member.mb_attribute == '관리자')}">
						<input type="button" class="uplode_bnt" value="상품 등록" onclick="location.href='store_input'">
				</c:if>
			</div>
			<div class="store_items">
				<div class="category_title"> 카테고리 별 인기 굿즈</div>
				<div class="category_list">
					<div class="category"><a href="store_main">전체</a></div>
					<div class="category"><a href="store_main_category?category=굿즈">#굿즈</a></div>
					<div class="category"><a href="store_main_category?category=포토카드">#포토카드</a></div>
					<div class="category"><a href="store_main_category?category=키캡">#키캡</a></div>
					<div class="category"><a href="store_main_category?category=아크릴 굿즈">#아크릴 굿즈</a></div>
					<div class="category"><a href="store_main_category?category=틴케이스">#틴케이스</a></div>
					<div class="category"><a href="store_main_category?category=상의">#상의</a></div>
				</div>
				<div class="product_list">
					<c:forEach items="${list}" var="s">
						<div class="prodicts">
							<a href="store_detail?pd_number=${s.pd_number}">
								<img src="./resources/store/item_cover/${s.pd_photo}">
								<span>${s.pd_name}</span>
								<span>${s.pd_price}</span>
							</a>
						</div>
					</c:forEach>
				</div>
			</div>
		</div>
	</section>
</body>
</html>
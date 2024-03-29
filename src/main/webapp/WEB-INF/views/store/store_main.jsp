<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="${pageContext.request.contextPath}/resources/css/store_main.css" rel="stylesheet" type="text/css">
<title>Creator Link_Store Main</title>
</head>
<body>
	<section class=store_container>
			<div class="">
				<h2>굿즈 스토어</h2>
				<div class="store_list"></div>
				</div>
				<div class="store_notices">
					<h2>공지 내용</h2>
				</div>
				<div class="store_gifthub">
					<h2>GiftHub</h2>
					<div>
						<a href="gifthub">
						<img src="./resources/store/item_cover/gift.png" width="100"></a>
					</div>
					<h2>협력사</h2>
				<div class=store_list></div>
			</div>
			<div>
				<c:forEach items="${list}" var="s">
					<div><a href="store_detail?pd_number=${s.pd_number}">
						<span><img src="./resources/store/item_cover/${s.pd_photo}" width="100"></span>
						<span>${s.pd_name}</span>
						<span>${s.pd_price}</span></a>
					</div>
				</c:forEach>
			</div>
		<c:choose>
			<c:when test="${loginState == true}">
				<input type="button" value="상품 등록" onclick="location.href='store_input'">
			</c:when>
			<c:otherwise>
			</c:otherwise>
		</c:choose>
	</section>
</body>
</html>
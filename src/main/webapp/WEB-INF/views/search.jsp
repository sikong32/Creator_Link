<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="${pageContext.request.contextPath}/resources/css/search.css" rel="stylesheet" type="text/css">
<title>Insert title here</title>
</head>
<body>
	<section class="search_tot">
		<div class="search_creator">
			<h2>크리에이터 목록</h2>
				<c:choose>
					<c:when test="${creator.size() == 0}">
						<div class="search_result">
							<div class="search_null"><h2>검색결과가 없습니다</h2></div>
						</div>
					</c:when>
					<c:otherwise>
						<c:forEach begin="0" end="${creator.size()-1}" var="i">
							<ul class="search_result">
								<li class="search_result_id">${creator.get(i).getMb_id()}</li>
								<li class="search_result_picture"><img src="./resources/cssimage/happy.jpg"></li>
							</ul>
							<c:if test="${i != creator.size()-1}"></c:if>
						</c:forEach>
					</c:otherwise>
				</c:choose>
		</div>
		
		<div class="search_goods">
			<h2>상품 목록</h2>
				<c:choose>
					<c:when test="${item.size() == 0}">
						<div class="search_result">
							<div class="search_null"><h2>검색결과가 없습니다</h2></div>
						</div>
					</c:when>
					<c:otherwise>
						<c:forEach begin="0" end="${item.size()-1}" var="i">
							<ul class="search_result">
								<li><img src="./resources/store/item_cover/${item.get(i).getPd_photo()}" width="100px;" height="100px"></li>
								<li>상품명 : ${item.get(i).getPd_name()} &emsp;</li>
								<li>가격 : ${item.get(i).getPd_price()} &emsp;</li>
								<li>재고 : ${item.get(i).getPd_stock()} &emsp;</li>
								<li>판매자 : ${item.get(i).getMb_number()} &emsp;</li>
							</ul>
							<c:if test="${i != item.size()-1}"><br></c:if>
						</c:forEach>
					</c:otherwise>
				</c:choose>
		</div>
	</section>
</body>
</html>
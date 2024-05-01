<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
	<title>Insert title here</title>
	<link href="${pageContext.request.contextPath}/resources/css/search.css" rel="stylesheet" type="text/css">
</head>
<body>
	<div class="search_top">
		<div class="search_container">
			<div class="creator_box">
				<c:choose>
					<c:when test="${creator.size() == 0}">
						<span>검색결과가 없습니다</span>
					</c:when>
					<c:otherwise>
						<div style="display: flex;">
							<c:forEach items="${creator}" var="ct" varStatus="state">
								<a href="board_main?mb_number=${ct.mb_number}">
									<img src="./resources/member/
									<c:if test="${ct.mb_photo == 'basic_photo.png'}">basic_photo</c:if>
									<c:if test="${ct.mb_photo != 'basic_photo.png'}">profile</c:if>
									/${ct.mb_photo}" width="100px">
								</a>
								${ct.mb_nick_name}
								<c:if test="${state.index != creator.size()-1}"><br></c:if>
							</c:forEach>
						</div>
					</c:otherwise>
				</c:choose><br>
			</div>
			
			<div class="store_box">
				<c:choose>
					<c:when test="${item.size() == 0}">
						검색결과가 없습니다
					</c:when>
					<c:otherwise>
						<c:forEach items="${seller}" var="sl">
							판매자 : ${sl}<br>
							<div style="width: 30%; height: 1px; background-color: black;"></div><br>
							<c:forEach items="${item}" var="it">
								<div style="display: flex;">
									<c:if test="${sl == it.mb_nick_name}">
										<div>
											<a href="store_detail?pd_number=${it.pd_number}"><img src="./resources/store/item_cover/${it.pd_photo}" width="100px;" height="100px"></a>
										</div>
										<div>
											상품명 : ${it.pd_name} <br>
											가격 : ${it.pd_price} <br>
											재고 : ${it.pd_stock} <br>
										</div>
										<br>
									</c:if>
								</div>
							</c:forEach><br>
						</c:forEach>
					</c:otherwise>
				</c:choose>
			</div>
		</div>
	</div>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<span>크리에이터 목록</span><br>
	<c:choose>
		<c:when test="${creator.size() == 0}">
			<span>검색결과가 없습니다</span>
		</c:when>
		<c:otherwise>
			<c:forEach begin="0" end="${creator.size()-1}" var="i">
				<img src="./resources/member/
				<c:if test="${creator.get(i).getMb_photo() == 'basic_photo.png'}">basic_photo</c:if>
				<c:if test="${creator.get(i).getMb_photo() != 'basic_photo.png'}">profile</c:if>
				/${creator.get(i).getMb_photo()}">
				${creator.get(i).getMb_id()}
				<c:if test="${i != creator.size()-1}"><br></c:if>
			</c:forEach>
		</c:otherwise>
	</c:choose><br>
	
	<div style="width: 60%; height: 1px; background-color: black;"></div>
	
	<span>상품 목록</span><br>
	<c:choose>
		<c:when test="${item.size() == 0}">
			검색결과가 없습니다
		</c:when>
		<c:otherwise>
			<c:forEach begin="0" end="${seller.size()-1}" var="i">
				판매자 : ${seller.get(i)}<br>
				<div style="width: 30%; height: 1px; background-color: black;"></div><br>
				<c:forEach items="${item}" var="t">
					<c:if test="${seller.get(i) == t.mb_id}">
						<img src="./resources/store/item_cover/${t.pd_photo}" width="100px;" height="100px">
						상품명 : ${t.pd_name} &emsp;
						가격 : ${t.pd_price} &emsp;
						재고 : ${t.pd_stock} &emsp;
						판매자 : ${t.mb_id} &emsp;
						<br>
					</c:if>
				</c:forEach><br>
			</c:forEach>
		</c:otherwise>
	</c:choose>
</body>
</html>
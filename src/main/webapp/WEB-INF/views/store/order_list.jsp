<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<form action="">
<ul>
<c:forEach items="${order_list}" var="od">
<li>
<a href="store_detail?pd_number=${od.od_pd_number}"><img alt="" src="./resources/store/item_cover/${od.image}" width="100px"></a>
상품명: ${od.od_pd_name}<br>
주문 개수: ${od.od_pd_qnt}<br>
주문 가격: ${od.od_price}<br>
주문 일자: ${od.od_date}<br>
<c:choose>
<c:when test="${od.os_name!=null}">
옵션 이름: ${od.os_name}<br>
</c:when>
</c:choose>
배송 주소: ${od.dlvy_address}<br>
삭세 주소: ${od.dlvy_detail}<br>
배송 메시지: ${od.dlvy_comment}<br>
</li>
<br>
</c:forEach>
</ul>
</form>
</body>
</html>
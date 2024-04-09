<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	스토어가 어느정도 진행되면 시작예정<br>
	장바구니 테이블에서 유저id 기준으로<br>
	----------------<br>
	<form action="shoping_buy" method="post">
		<c:forEach items="${os_list}" var="os">
			<img alt="" src="./resources/store/item_cover/${os.os_photo}" width="100">
		상품명${os.os_1name}${os.os_2name}${os.os_3name}, 가격${os.os_price}<br>
		<input type="checkbox" name="selectedOs" value="${os.os_number}"><br>
		</c:forEach>
		<c:forEach items="${pd_list}" var="pd">
			<img alt="" src="./resources/store/item_cover/${pd.pd_photo}" width="100">
			상품명 : ${pd.pd_name}, 가격 : ${pd.pd_price} <br>
			<input type="checkbox" name="selectedPd" value="${pd.pd_number}"><br>
		</c:forEach>
		<br>
		가격 합계 : 
		<input type="submit" value="결제하기">
	</form>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<ul>
		<li>구매해주셔서 감사합니다. 최대한 빨리 배송 해드릴 수 있독록 노력하겠습니다. ^^</li>
		<li>배송주소: ${od_address}</li>
		<li>구매번호: ${od_number}</li>
		<li>결제금액: ${od_price}</li>

		<li><input type="button" value="HOME" onclick="location.href='index'"></li>
	</ul>
</body>
</html>
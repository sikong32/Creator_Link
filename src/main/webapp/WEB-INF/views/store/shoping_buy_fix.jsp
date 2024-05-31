<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
	.buyfix_conteyna {
	    display: flex;
	    justify-content: center;
    }
    .buyfix {
	    width: 50%;
	    box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
	    margin-top: 3vh;
    }
    ul{
        list-style-type: none;
    }
</style>
</head>
<body>
<div class="buyfix_conteyna">
	<div class="buyfix">
		<ul>
			<li>구매해주셔서 감사합니다. 최대한 빨리 배송 해드릴 수 있독록 노력하겠습니다. ^^</li>
			<li>배송주소: ${od_address}</li>
			<li>구매번호: ${od_number}</li>
			<li>결제금액: <fmt:formatNumber pattern="#,###" value="${od_price}"/></li>
	
			<li><input type="button" value="HOME" onclick="location.href='index'"></li>
		</ul>
	</div>
</div>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<form action="">
		<table>
			<tr>
				<th><img src="./resources/store/item_cover/${dto.pd_photo}"	width="100"></th>
			</tr>
		</table>
	</form>
	<form action="shoping_buy" method="post" name="shoping_buy_form">
		<table border="1">
			<tr>
				<th>상품명</th>
				<td>${dto.pd_name}
				<input type="hidden" name="pd_number" value="${dto.pd_number}">
				</td>
			</tr>
			<tr>
				<th>가격</th>
				<td>${dto.pd_price}원</td>
			</tr>
			<tr>
				<th>재고</th>
				<td>${dto.pd_stock}</td>
			</tr>
			<tr>
				<th>배송 예상일</th>
				<td>${today}</td>
			</tr>
			<c:choose>
			    <c:when test="${not empty os1name and os1name[0] ne null}">
			        <tr>
			            <th>옵션1</th>
			            <td>
			                <select name="os_1" id="os_1">
			                    <c:forEach items="${os1name}" var="s">
			                        <option value="${s}">${s}</option>
			                    </c:forEach>
			                </select>
			            </td>
			        </tr>
			    </c:when>
			</c:choose>
			<c:choose>
			    <c:when test="${not empty os2name and os2name[0] ne null}">
			        <tr>
			            <th>옵션2</th>
			            <td>
			                <select name="os_2" id="os_2">
			                    <c:forEach items="${os2name}" var="s">
			                        <option value="${s}">${s}</option>
			                    </c:forEach>
			                </select>
			            </td>
			        </tr>
			    </c:when>
			</c:choose>
			<c:choose>
			    <c:when test="${not empty os3name and os3name[0] ne null}">
			        <tr>
			            <th>옵션3</th>
			            <td>
			                <select name="os_3" id="os_3">
			                    <c:forEach items="${os3name}" var="s">
			                        <option value="${s}">${s}</option>
			                    </c:forEach>
			                </select>
			            </td>
			        </tr>
			    </c:when>
			</c:choose>
			<tr>
				<th>구매수량</th>
				<td>
				<c:choose>
					<c:when test="${dto.pd_stock < 1}">
						품절
					</c:when>
					<c:otherwise>
						<select name="buy_quantity">
							<c:forEach begin="1" end="${dto.pd_stock}" var="i">
								<option value="${i}">${i}</option>
							</c:forEach>
						</select>
					</c:otherwise>
				</c:choose>
				</td>
			</tr>
			<tr>
				<td><input type="button" value="장바구니" 
					onclick="" 
					<c:if test="${dto.pd_stock < 1}">disabled</c:if>></td>
				<td><input type="button" value="구매" onclick="login_check()"
					<c:if test="${dto.pd_stock < 1}">disabled</c:if>></td>
			</tr>
		</table>
	</form>
	<form action="">
		<table border="1">
			<tr>
				<th>상세정보</th>
				<td><div>${dto.pd_content}</div></td>
			</tr>
			<tr>
				<th>리뷰</th>
				<td>내용</td>
			</tr>
		</table>
	</form>
</body>
<script type="text/javascript">
function login_check() {
	var login = "${loginState}";
	if(login == "true"){
		var f = document.shoping_buy_form;
		f.submit();
	}else{
		alert("로그인이 필요합니다.");
		window.location.href="login";
	}
}
</script>
</html>
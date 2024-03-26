<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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
	<form action="">
		<table border="1">
			<tr>
				<th>상품명</th>
				<td>${dto.pd_name}</td>
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
			<tr>
				<th>옵션</th>
				<td><select>
						<option value="">옵션1
						<option value="">옵션2
				</select></td>
			</tr>
			<tr>
				<td><input type="button" value="장바구니" onclick=""></td>
				<td><input type="button" value="구매"
					onclick="location.href='shoping_buy'"></td>
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
</html>
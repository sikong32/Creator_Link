<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<script	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script type="text/javascript" src="resources/js/address.js"></script>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<form action="shoping_buy_fix">
		<table border="1">
			<tr>
				<th>아이템 리스트</th>
			</tr>
			<tr>
				<td><img
					src="https://image1.marpple.co/files/u_3300167/2024/1/original/872be372507d7301aca396a37c556cd82aeffda61.png?q=92&w=1480&f=jpeg&bg=f6f6f6"
					width="100">아이템이미지</td>
				<td>아이템가격</td>
			</tr>
			<tr>
				<td><img
					src="https://image1.marpple.co/files/u_3300167/2024/1/original/872be372507d7301aca396a37c556cd82aeffda61.png?q=92&w=1480&f=jpeg&bg=f6f6f6"
					width="100">아이템이미지2</td>
				<td>아이템가격2</td>
			</tr>
			<tr>
				<td>배송정보</td>
				<td><input type="text" id="sample4_postcode" placeholder="우편번호">
					<input type="button" onclick="sample4_execDaumPostcode()" value="우편번호 찾기"><br>
					<input type="text" id="sample4_roadAddress" placeholder="도로명주소">
					<input type="text" id="sample4_jibunAddress" placeholder="지번주소">
					<span id="guide" style="color:#999;display:none"></span>
					<input type="text" id="sample4_detailAddress" placeholder="상세주소">
				</td>
			</tr>
			<tr>
				<td>연락처<input type="text" value="">
				</td>
			</tr>
			<tr>
				<td>수취인<input type="text" value=""></td>
			</tr>
			<tr>
				<td>쿠폰</td>
				<td>보유 쿠폰 0<td>
				<td><select name="쿠폰" id="쿠폰">
				<option value="쿠폰1">쿠폰1</option>
				<option value="쿠폰2">쿠폰2</option>
				<option value="쿠폰3">쿠폰3</option>
				</select></td>
				<td><input type="button" value="적용" onclick=""></td>
			</tr>
			<tr>
				<th>결제 방법</th>
				<td>
				<input type="button" name="카드" id="카드" value="카드">
				<input type="button" name="계좌" id="계좌" value="계좌">
				<input type="button" name="페이" id="페이" value="페이">
				<td>
			</tr>
			<tr>
				<th>실제 가격</th>
				<td>000원</td>
			</tr>
			<tr>
				<td>
				<input type="submit" value="구매">
				<input type="reset" value="취소" onclick="location.href='index'">
				</td>
			</tr>
		</table>
	</form>
</body>
<script type="text/javascript" src="./js/address.js"></script>
</html>
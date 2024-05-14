<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<script	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script	src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script type="text/javascript" src="resources/js/address.js"></script>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
.shoping_container{
	width: 50vw;
	text-align: center;
	margin: auto;
}
.shoping_container table {
	width: 50vw;
	text-align: center;
}
.shoping_container img {
	min-width:100px;
	max-width:200px;
	text-align: center;
}
.shoping_container th {
	color: #333333; /* 헤더 셀 텍스트 색상 */
	background-color: #f2f2f2; /* 헤더 셀의 배경색 */
	width: 4vw;
	height: 2vw;
}
.shoping_container td {
	background-color: #ffffff; /* 일반 셀의 배경색 */
	color: #666666; /* 일반 셀 텍스트 색상 */
	width: 1vw;
	height: 2vw;
}
.shoping_container input[type="button"],input[type="submit"],input[type="reset"] {
	font-size: 16px;
	width: 6vw;
	height: 2vw;
}
.shoping_container input[type="text"],input[type="number"]{
	font-size: 16px;
	width: 18vw;
	height: 1.5vw;
	text-align: center;
}
</style>
</head>
<body>
<div class="shoping_container">
	<form action="shoping_buy_fix">
		<table>
		<tr>
			<th>아이템 이름</th>
			<td><input type="hidden" name="pd_number" value="${pddto.pd_number}">
			<input type="hidden" name="seller_mb_number" value="${seller_mb_number}">
			<input type="hidden" name="pd_name" value="${pddto.pd_name}">${pddto.pd_name}</td>
		</tr>
		<c:if test="${os_full_name!=null}">
			<tr>
				<th>옵션 이름</th>
				<td><input type="hidden" name="os_number" value="${osdto.os_number}">
				<input type="hidden" name="pd_name" value="${pddto.pd_name},${os_full_name}">${os_full_name}</td>
			</tr>
		</c:if>
		<tr>
			<th>이미지</th>
			<td><img src="./resources/store/item_cover/${pddto.pd_photo}"></td>
		</tr>
		<tr>
			<th>가격</th>
			<c:choose>
				<c:when test="${osdto.os_price!=null}">
					<td>${osdto.os_price}원</td>
				</c:when>
				<c:otherwise>
					<td>${pddto.pd_price}원</td>
				</c:otherwise>
			</c:choose>
		</tr>
		<tr>
			<th>구매 수량</th>
			<td> <input type="number" name="buy_quantity" value="${buy_quantity}" min="1" max="${pddto.pd_stock}" onchange="updatePrice(this.value)">
			</td>
		</tr>
		<tr>
			<th>배송정보</th>
			<td><input type="text" name="zip_code" id="sample4_postcode" placeholder="우편번호" value="${member.mb_addr_post}"><br>
				<input type="button" onclick="sample4_execDaumPostcode()"
				value="우편번호 찾기"><br> 
				<input type="text" name="dlvy_address" id="sample4_roadAddress" placeholder="도로명주소" value="${member.mb_addr_road}" required><br>
				<input type="text" name="dlvy_address_dong" id="sample4_jibunAddress" placeholder="지번주소" value="${member.mb_addr_local}" required><br>
				<span id="guide" style="color: #999; display: none"></span> 
				<input type="text" name="dlvy_detail" id="sample4_detailAddress" placeholder="상세주소" value="${member.mb_addr_detail}" required maxlength="50"><br>
				<input type="text" name="dlvy_comment" placeholder="배송 메시지" maxlength="20">
			</td>
		</tr>
		<tr>
			<th>연락처</th><td><input type="text" value="${member.mb_phone}" required maxlength="11"></td>
		</tr>
		<tr>
			<th>수취인</th><td><input type="text" value="${member.mb_name}" required maxlength="10"></td>
		</tr>
		<tr>
			<th>쿠폰</th>
			<td>보유 쿠폰 0
			<select name="od_cp_code" id="od_cp_code">
					<option value="co_code1">쿠폰1</option>
					<option value="co_code2">쿠폰2</option>
					<option value="co_code3">쿠폰3</option>
			</select>
			<input type="button" value="적용" onclick=""></td>
		</tr>
		<tr>
			<th>결제 방법</th>
			<td><input type="button" name="카드" id="카드" value="카드">
				<input type="button" name="계좌" id="계좌" value="계좌">
				<input type="button" name="페이" id="페이" value="페이">
			</td>
		</tr>
		<tr>
			<th>결제 금액</th>
			<c:choose>
				<c:when test="${osdto.os_price!=null}">
					<td><input id="price" type="hidden" name="price" value="${osdto.os_price}"><span id="price1">${osdto.os_price}원</span></td>
				</c:when>
				<c:otherwise>
					<td><input id="price" type="hidden" name="price" value="${pddto.pd_price}"><span id="price1">${pddto.pd_price}원</span></td>
				</c:otherwise>
			</c:choose>
		</tr>
		<tr>
			<td colspan="2"><input type="submit" value="구매">
			<input type="reset" value="취소" onclick="location.href='index'"></td>
		</tr>
		</table>
	</form>
</div>
</body>
<script>
    // 수량 입력란의 값이 변경될 때마다 호출되는 함수
    function updatePrice(quantity) {
        var price = 0; // 초기 가격 설정
        // 수량에 따른 가격 계산
        price = ${osdto.os_price} * quantity;
        // 가격을 전송할 요소에 새로운 가격 설정
        document.getElementById("price").value = price;
        document.getElementById("price1").innerHTML = price + "원";
    }
</script>
</html>
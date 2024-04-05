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
</head>
<body>
	<form action="shoping_buy_fix">
		<div class="shoping_container">
			<table>
			<tr>
				<th>아이템 리스트</th>
			</tr>
			<tr>
				<td>아이템 이름: <input type="hidden" name="pd_number" value="${pddto.pd_number}">
				<input type="hidden" name="pd_name" value="${pddto.pd_name}">${pddto.pd_name}</td>
			</tr>
			<c:choose>
			<c:when test="${os_full_name!=null}">
			<tr>
				<td>옵션 이름: <input type="hidden" name="os_number" value="${osdto.os_number}">
				<input type="hidden" name="pd_name" value="${pddto.pd_name},${os_full_name}">${os_full_name}</td>
			</tr>
			</c:when>
			</c:choose>
			<tr>
				<td>이미지
				<img src="./resources/store/item_cover/${pddto.pd_photo}" width="100"></td>
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
				<td>구매 수량: <input type="number" name="buy_quantity" value="${buy_quantity}" min="1" max="${pddto.pd_stock}">
				</td>
			</tr>
			<tr>
				<td>배송정보</td>
				<td><input type="text" name="zip_code" id="sample4_postcode" placeholder="우편번호">
					<input type="button" onclick="sample4_execDaumPostcode()"
					value="우편번호 찾기"><br> 
					<input type="text" name="dlvy_address" id="sample4_roadAddress" placeholder="도로명주소" required>
					<input type="text" name="dlvy_address_dong" id="sample4_jibunAddress" placeholder="지번주소" required>
					<span id="guide" style="color: #999; display: none"></span> 
					<input type="text" name="dlvy_detail" id="sample4_detailAddress" placeholder="상세주소" required maxlength="50">
					<input type="text" name="dlvy_comment" placeholder="배송 메시지" maxlength="20">
				</td>
			</tr>
			<tr>
				<td>연락처<input type="text" value="${member.mb_phone}" required></td>
			</tr>
			<tr>
				<td>수취인<input type="text" value="${member.mb_name}" required></td>
			</tr>
			<tr>
				<td>쿠폰</td>
				<td>보유 쿠폰 0
				<td>
				<td><select name="od_cp_code" id="od_cp_code">
						<option value="co_code1">쿠폰1</option>
						<option value="co_code2">쿠폰2</option>
						<option value="co_code3">쿠폰3</option>
				</select></td>
				<td><input type="button" value="적용" onclick=""></td>
			</tr>
			<tr>
				<th>결제 방법</th>
				<td><input type="button" name="카드" id="카드" value="카드">
					<input type="button" name="계좌" id="계좌" value="계좌"> <input
					type="button" name="페이" id="페이" value="페이">
				<td>
			</tr>
			<tr>
				<th>결제 금액</th>
				<c:choose>
					<c:when test="${osdto.os_price!=null}">
						<td><input type="hidden" name="price" value="${osdto.os_price}">${osdto.os_price}원</td>
					</c:when>
					<c:otherwise>
						<td><input type="hidden" name="price" value="${pddto.pd_price}">${pddto.pd_price}원</td>
					</c:otherwise>
				</c:choose>
			</tr>
			<tr>
				<td><input type="submit" value="구매"> <input
					type="reset" value="취소" onclick="location.href='index'"></td>
			</tr>
			</table>
		</div>
	</form>
</body>
</html>
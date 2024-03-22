<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<script	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
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
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>
    //본 예제에서는 도로명 주소 표기 방식에 대한 법령에 따라, 내려오는 데이터를 조합하여 올바른 주소를 구성하는 방법을 설명합니다.
    function sample4_execDaumPostcode() {
	    new daum.Postcode({
	        oncomplete: function(data) {
	            // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.
	
	            // 도로명 주소의 노출 규칙에 따라 주소를 표시한다.
	            // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
	            var roadAddr = data.roadAddress; // 도로명 주소 변수
	            var extraRoadAddr = ''; // 참고 항목 변수
	
	            // 법정동명이 있을 경우 추가한다. (법정리는 제외)
	            // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
	            if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
	                extraRoadAddr += data.bname;
	            }
	            // 건물명이 있고, 공동주택일 경우 추가한다.
	            if(data.buildingName !== '' && data.apartment === 'Y'){
	               extraRoadAddr += (extraRoadAddr !== '' ? ', ' + data.buildingName : data.buildingName);
	            }
	            // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
	            if(extraRoadAddr !== ''){
	                extraRoadAddr = ' (' + extraRoadAddr + ')';
	            }
	
	            // 우편번호와 주소 정보를 해당 필드에 넣는다.
	            document.getElementById('sample4_postcode').value = data.zonecode;
	            document.getElementById("sample4_roadAddress").value = roadAddr;
	            document.getElementById("sample4_jibunAddress").value = data.jibunAddress;
	        }
	    }).open();
	}
</script>
</html>
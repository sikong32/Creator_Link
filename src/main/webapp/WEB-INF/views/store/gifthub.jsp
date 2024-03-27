<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<script type="text/javascript" src="resources/js/address.js"></script>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	선물대상(크리에이터 게시판에서 정보를 넘겨옴)<br>
	-신청서<br>
	박스사이즈 이미지 선택으로 했으면 좋겠<br>
	카테고리 select option으로 선택할 예정<br>
	카테고리상세 select option으로 선택할 예정<br>
	상품명 : <input type="text" name="item_name"><br>
	
		<input type="text" id="sample4_postcode" placeholder="우편번호">
		<input type="button" onclick="sample4_execDaumPostcode()" value="우편번호 찾기"><br>
		<input type="text" id="sample4_roadAddress" placeholder="도로명주소">
		<input type="text" id="sample4_jibunAddress" placeholder="지번주소">
		<span id="guide" style="color:#999;display:none"></span>
		<input type="text" id="sample4_detailAddress" placeholder="상세주소"><br>
	<a href="#">선물전송</a>
</body>
<script type="text/javascript" src="./js/address.js"></script>
</html>
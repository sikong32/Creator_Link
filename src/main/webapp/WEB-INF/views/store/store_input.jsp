<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<script src="https://cdn.ckeditor.com/ckeditor5/34.2.0/super-build/ckeditor.js"></script>
<script type="text/javascript" src="resources/js/store_option.js"></script>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
/* .item_input 영역의 스타일링 */
.item_input {
    max-width: 80vw; /* 최대 너비 설정 */
    margin: 1vw auto; /* 상하 마진 20px, 좌우 자동 중앙 정렬 */
    padding: 20px; /* 내부 여백 설정 */
    background-color: #ffffff; /* 배경색을 흰색으로 설정 */
    border-radius: 8px; /* 모서리를 둥글게 처리 */
    box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1); /* 박스 그림자 추가 */
    font-size: 0.9vw; /* 폰트 크기를 뷰포트 너비의 1%로 설정 */
    overflow: hidden; /* 내용이 div를 넘어가면 숨김 */
    font-family:'Pretendard-Regular';
}

/* .item_input 내부의 목록 스타일링 */
.item_input ul {
    list-style-type: none; /* 목록 기호 제거 */
    padding: 0; /* 내부 여백 제거 */
}

/* .item_input 내부의 각 목록 항목 스타일링 */
.item_input li {
    margin-bottom: 10px; /* 각 항목 하단에 마진 추가 */
}

/* 텍스트, 숫자 입력 및 파일 선택 필드 스타일링 */
.item_input input[type="text"],
.item_input input[type="number"],
.item_input input[type="file"],
.item_input select,
.item_input textarea {
    width: 10vw; /* 너비를 부모 요소의 100%로 설정 */
    padding: 8px; /* 내부 패딩 설정 */
    margin-top: 2px; /* 상단 마진 설정 */
    border: 1px solid #ccc; /* 테두리 설정 */
    border-radius: 4px; /* 테두리 모서리 둥글게 처리 */
}

/* 라디오 버튼 스타일링 */
.item_input input[type="radio"] {
    margin-right: 5px; /* 오른쪽 마진 추가 */
}

/* 버튼 스타일링 */
.item_input input[type="button"] {
    background-color: #2a2f4f; /* 배경색 설정 */
    color: white; /* 글자색 흰색으로 설정 */
    border: none; /* 테두리 제거 */
    padding: 10px 20px; /* 패딩 설정 */
    text-align: center; /* 텍스트 가운데 정렬 */
    text-decoration: none; /* 텍스트 장식 제거 */
    display: inline-block; /* 인라인 블록으로 표시 */
    font-size: 16px; /* 글자 크기 설정 */
    margin: 4px 2px; /* 마진 설정 */
    cursor: pointer; /* 마우스 커서를 포인터로 설정 */
    border-radius: 4px; /* 테두리 모서리 둥글게 처리 */
}

/* 버튼 호버 시 스타일 변경 */
.item_input input[type="button"]:hover {
    background-color: #5a2f4f; /* 호버 시 배경색 변경 */
}
</style>
</head>
<body>
<div style="background-color: #f4f6f8;">
	<form action="store_save" id="form_input" method="post"
		enctype="multipart/form-data">
		<div class="item_input">
			<ul>
				<li>상품카테고리</li>
				
				<li>상품카테고리 선택<select name="pd_category" required="required"><c:forEach items="${category}" var="ca"><option>${ca.prbt_big_cls}=>${ca.prdt_mid_cls}${ca.prdt_small_cls}</option></c:forEach></select></li>
				
				<li>상품명</li>
				<li><input type="text" name="pd_name" required="required" placeholder="최대 100자" maxlength="100"></li>
				<li>상품가격</li>
				<li><input type="number" name="pd_price" min="1" max="9999999999" required="required" placeholder="최소 1원"></li>
				<li>상품대표 이미지</li>
				<li><input type="file" name="pd_photo" required="required"></li>
				<li>
					<input type="radio" name="os_radio" id="os_apply" value="Y" onchange="os_Category_create()">옵션 사용
					<input type="radio" name="os_radio" id="os_Unapplied" value="N" onchange="os_Category_delete()" checked>옵션 사용안함
					<div id="os_Categories" class="os_Categories"><!-- 여기에 옵션 카테고리 추가됨 --></div>
					<div id="os_print" class="os_print"><!-- 여기에 옵션 카테고리 추가됨 --></div>
					<div id="os_out" class="os_out"><!-- 여기에 옵션 카테고리 추가됨 --></div>
				</li>
				<li>상품 모든 재고</li>
				<li><input type="number" min="0" max="9999999999" id="pd_stock" name="pd_stock" required="required" placeholder="0개 입력시 품절"></li>
				<li>상세페이지</li>
				<li><textarea id="editor" name="pd_content" cols="20" rows="5"></textarea></li>
				<li><input type="button" value="전송" onclick="val_check()"></li>
			</ul>
		</div>
	</form>
</div>
</body>
<script type="text/javascript" src="resources/js/input_editor.js"></script>
<script type="text/javascript" src="resources/js/editor_check.js"></script>
</html>
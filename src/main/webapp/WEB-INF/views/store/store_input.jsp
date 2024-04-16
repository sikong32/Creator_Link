<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<script src="https://cdn.ckeditor.com/ckeditor5/34.2.0/super-build/ckeditor.js"></script>
<script type="text/javascript" src="resources/js/store_option.js"></script>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<form action="store_save" id="form_input" method="post"
		enctype="multipart/form-data">
		<div>
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
</body>
<script type="text/javascript" src="resources/js/input_editor.js"></script>
<script type="text/javascript" src="resources/js/editor_check.js"></script>
</html>
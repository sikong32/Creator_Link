<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<script src="https://cdn.ckeditor.com/ckeditor5/34.2.0/super-build/ckeditor.js"></script>
<script type="text/javascript" src="resources/js/stooe_option.js"></script>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<form action="store_save" method="post" enctype="multipart/form-data">
		<div>
			<ul>
				<li>상품카테고리</li>
				<li><input type="text" name="pd_category"></li>
				<li>상품명</li>
				<li><input type="text" name="pd_name"></li>
				<li>상품가격</li>
				<li><input type="text" name="pd_price"></li>
				<li>상품대표 이미지</li>
				<li><input type="file" name="pd_pohto"></li>
				<li><div id="optionCategories">
				    <!-- 여기에 옵션 카테고리 추가됨 -->
					</div>
					
				<input  type="button" onclick="addOptionCategory()" value="옵션 카테고리 추가"></li>
				<li>상품 모든 재고</li>
				<li><input type="number" min="0" id="pd_stock" name="pd_stock"></li>
				<li>상세페이지</li>
				<li><textarea id="editor" name="pd_content" cols="20" rows="5"></textarea></li>
				<li><input type="submit" value="전송"></li>
			</ul>
		</div>
	</form>
</body>
<script type="text/javascript" src="resources/js/input_editor.js"></script>
</html>
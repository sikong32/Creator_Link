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
	<form action="store_product_modify_save" id="form_input" method="post"	enctype="multipart/form-data">
		<div>
			<ul>
				<li>기존 카테고리: ${pd_dto.pd_category}<input type="hidden" name="pd_number" value="${pd_dto.pd_number}"></li>
				<li>상품카테고리 선택<select name="pd_category" required="required"><c:forEach items="${category}" var="ca"><option value="${ca.prbt_big_cls}=>${ca.prdt_mid_cls}${ca.prdt_small_cls}">${ca.prbt_big_cls}=>${ca.prdt_mid_cls}${ca.prdt_small_cls}</option></c:forEach></select></li>
				<li>상품명<input type="text" name="pd_name" required="required" placeholder="최대 100자" maxlength="100" value="${pd_dto.pd_name}"></li>
				<li>상품가격<input type="number" name="pd_price" min="1" max="9999999999" required="required" placeholder="최소 1원" value="${pd_dto.pd_price}"></li>
				<li>상품대표 이미지
				<label for="pd_photo">
				<img alt="" src="./resources/store/item_cover/${pd_dto.pd_photo}" id="pd_basic_photo" width="100px" style="max-height: 100px;">
				</label>
				<input type="file" id="pd_photo" name="pd_photo" onchange="previewImage(event)" style="display: none;" accept="image/png, image/jpeg, image/gif" >
				<input type="hidden" name="pd_org_photo" value="${pd_dto.pd_photo}"></li>
				<c:if test="${os_list.size()!=0}">
					<li>
						<c:forEach items="${os_list}" var="os">
							<input type="hidden" name="os_number" value="${os.os_number}">
							<li>
							<label for="os_photo_${os.os_number}">
							<c:if test="${not empty os.os_photo}"><img alt="" src="./resources/store/item_cover/${os.os_photo}" id="os_basic_photo_${os.os_number}" width="100px" style="max-height: 100px;"></c:if>
							</label>
							<input type="file" name="os_photo_${os.os_number}" id="os_photo_${os.os_number}" onchange="os_previewImage(event,${os.os_number})" value="${os.os_photo}" style="display: none;" accept="image/png, image/jpeg, image/gif">
							옵션 이름: <input type="text" name="os_1name_${os.os_number}" id="os_1name_${os.os_number}" value="${os.os_1name}">
							<c:if test="${not empty os.os_2name}"><input type="text" name="os_2name_${os.os_number}" id="os_2name_${os.os_number}" value="${os.os_2name}"></c:if>
							<c:if test="${not empty os.os_3name}"><input type="text" name="os_3name_${os.os_number}" id="os_3name_${os.os_number}" value="${os.os_3name}"></c:if>
							옵션 가격: <input type="number" name="os_price_${os.os_number}" id="os_price_${os.os_number}" value="${os.os_price}">
							옵션 재고: <input type="number" name="os_stock_${os.os_number}" id="os_stock_${os.os_number}" value="${os.os_stock}" onchange="tot_stock()" class="os_input_stock"></li>
						</c:forEach>
					</li>
				</c:if>
				<li>상품 모든 재고<input type="number" min="0" max="9999999999" id="pd_stock" name="pd_stock" required="required" placeholder="0개 입력시 품절" value="${pd_dto.pd_stock}"></li>
				<li>상세페이지</li>
				<li><textarea id="editor" name="pd_content" cols="20" rows="5">${pd_dto.pd_content}</textarea></li>
				<li><input type="button" value="전송" onclick="val_check()"></li>
			</ul>
		</div>
	</form>
</body>
<script type="text/javascript" src="resources/js/input_editor.js"></script>
<script type="text/javascript" src="resources/js/editor_check.js"></script>
<script type="text/javascript">
function previewImage(event) { //이미지 미리보기 함수
    const input = event.target;
    const preview = document.getElementById('pd_basic_photo');
    const file = input.files[0];
    const v_image = ['image/jpeg', 'image/png', 'image/gif'];//이미지 타입 체크
    const reader = new FileReader();
	if(file && v_image.includes(file.type)){
	    reader.onload = function(){
	        preview.src = reader.result;
	    };
	    reader.readAsDataURL(file);
	}else{
		alert("이미지 파일만 업로드 가능합니다.");
		this.value=""; //입력된 이미지 초기화
	}
}
function os_previewImage(event,os_number) { //옵션이미지 미리보기 함수
	const input = event.target;
	const preview = document.getElementById('os_basic_photo_'+os_number);
	const file = input.files[0];
    const v_image = ['image/jpeg', 'image/png', 'image/gif'];//이미지 타입 체크
	const reader = new FileReader();
	if(file && v_image.includes(file.type)){
	    reader.onload = function(){
	        preview.src = reader.result;
	    };
	    reader.readAsDataURL(file);
	}else{
		alert("이미지 파일만 업로드 가능합니다.");
		this.value=""; //입력된 이미지 초기화
	}
}
</script>
</html>
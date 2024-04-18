<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<form action="review_modify_save">
	<input type="hidden" name="pd_number" value="${dto.pd_number}">
	<input type="hidden" name="re_number" value="${re_dto.review_number}">
	상품명: ${dto.pd_name}
	<img alt="" src="./resources/store/item_cover/${dto.pd_photo}" width="100">
	리뷰점수:<select name="review_star">
        <option value="★★★★★" ${re_dto.re_star=="★★★★★" ?"selected":""}>★★★★★</option>
        <option value="★★★★" ${re_dto.re_star=="★★★★" ?"selected":""}>★★★★</option>
        <option value="★★★" ${re_dto.re_star=="★★★" ?"selected":""}>★★★</option>
        <option value="★★" ${re_dto.re_star=="★★" ?"selected":""}>★★</option>
        <option value="★" ${re_dto.re_star=="★" ?"selected":""}>★</option>
	</select>
	<textarea rows="10" cols="60" name="review_text" placeholder="리뷰를 등록해 주세요" required maxlength="200">${re_dto.re_content}</textarea><br>
	<input type="submit" value="리뷰 수정">
	<input type="button" value="취소" onclick="window.close()">
</form>
</body>
</html>
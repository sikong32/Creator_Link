<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<form action="review_save">
	<input type="hidden" name="pd_number" value="${dto.pd_number}">
	상품명: ${dto.pd_name}
	<img alt="" src="./resources/store/item_cover/${dto.pd_photo}" width="100">
	리뷰점수:<select name="review_star">
        <option value="★★★★★">★★★★★</option>
        <option value="★★★★">★★★★</option>
        <option value="★★★">★★★</option>
        <option value="★★">★★</option>
        <option value="★">★</option>
	</select>
	<textarea rows="10" cols="60" name="review_text" placeholder="리뷰를 등록해 주세요" required maxlength="200"></textarea><br>
	<input type="submit" value="리뷰 등록">
	<input type="button" value="취소" onclick="window.close()">
</form>
</body>
</html>
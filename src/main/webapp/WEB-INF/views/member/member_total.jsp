<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<style type="text/css">
.mypage_profile img {
	width: 80px;
	height: 80px;
	border-radius: 5px;
}
</style>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<div class = "mypage_profile">
	<c:choose>
		<c:when test="${dto.mb_photo eq 'basic_photo.png'}">
			<img alt="회원 기본 사진" src="resources/member/basic_photo/${dto.mb_photo }">
		</c:when>
		<c:otherwise>
			<img alt="회원 수정 사진" src="resources/member/profile/${dto.mb_photo }">
		</c:otherwise>
	</c:choose>
</div>
<pre>
닉네임 : ${dto.mb_nick_name }
회원유형 : ${dto.mb_attribute }
<input type="button" id="myPageLink" value="정보변경">
</pre>
<img alt="즐겨찾기" src="resources/member/totalPage_icon/Favorite.png" width="100px">
<img alt="찜목록" src="resources/member/totalPage_icon/dibs.png" width="100px"><br>
<img alt="쿠폰함" src="resources/member/totalPage_icon/coupon.png" width="100px">
<a href="order_list"><img alt="주문목록" src="resources/member/totalPage_icon/order.png" width="100px"></a>
<c:if test="${dto.mb_attribute =='크리에이터'}"><a href="store_management"><img alt="상품관리" src="resources/member/totalPage_icon/pretty_myFace.png" width="100px"></a></c:if>
<a href="shopping_cart_view"><img alt="장바구니" src="resources/member/totalPage_icon/cart.png" width="100px"></a><br>

<input type="hidden" name="id" value="${dto.mb_id }">
<input type="hidden" name="mb_number" value="${dto.mb_number }">

<script type="text/javascript">
$(document).ready(function() {
	//mypage 아이콘 클릭시 
	$("#myPageLink").click(function(event) {
		event.preventDefault(); //기본 이벤트 실행 방지(링크 이동 방지)
		
		var memberId = "${dto.mb_id}";
		var exId = memberId.trim();
		sendPostRequest("mypage", {"exId":exId});
	}); //#myPageLink

	//JS로 form생성 후 POST방식으로 데이터 전송
	function sendPostRequest(url, data) {
		var form = document.createElement("form");
		form.method = "post";
		form.action = "mypage";
		
		var input = document.createElement("input");
		input.type = "hidden";
		input.name = Object.keys(data)[0];
		input.value = data[Object.keys(data)[0]];
		form.appendChild(input);
		
		document.body.appendChild(form);
		form.submit();
	}
}); //document


</script>
</body>
</html>
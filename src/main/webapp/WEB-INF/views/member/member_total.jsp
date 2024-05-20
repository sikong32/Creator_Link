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
.mypage_textInfo{
	width: auto;
    height: min-content;
    margin-left: 20px;
}

.mypage_profile {
	display: flex;
	padding-bottom: 20px;
}

#mypage_body {
	display: flex;
}

.mypage_container {
	width: 100%;
	height: 50vh;
    display: flex;
    flex-direction: column;
    justify-content: center;
    align-items: center;
}

.mypage_tot {
	box-shadow: 2px 2px 5px rgba(0, 0, 0, 0.5);
	padding: 20px 20px;
	border-radius: 5px;
	flex-direction: column;
    justify-content: center;
    align-items: center;
}
#myPageLink {
	width: 85px;
    height: 40px;
    color: white;
    background-color: #2A2F4F;
    border-radius: 5px;
}
label {
	font-size: 18px;
	font-family:'Pretendard-Regular';
	text-align: left;
}

#favorites,#orderList,#coupons,#cart {
	padding-bottom: 20px;
}

#wishList, #product_management {
	padding-left: 20px;
	padding-right: 20px;
	padding-bottom: 20px;
}

</style>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<div class = "mypage_container">
	<div class = "mypage_tot">
	
		<div class = "mypage_profile">
			<c:choose>
				<c:when test="${dto.mb_photo eq 'basic_photo.png'}">
					<img alt="회원 기본 사진" src="resources/member/basic_photo/${dto.mb_photo }">
				</c:when>
				<c:otherwise>
					<img alt="회원 수정 사진" src="resources/member/profile/${dto.mb_photo }">
				</c:otherwise>
			</c:choose>
			<div class = "mypage_textInfo">
				<label for="nickName">닉네임 : ${dto.mb_nick_name }</label><br>
				<label for="memberType">회원유형 : ${dto.mb_attribute }</label><br>
				<input type="button" id="myPageLink" value="정보변경">
			</div>
		</div>
		
		<div class = "mypage_icon">
			<img id="favorites" alt="즐겨찾기" src="resources/member/totalPage_icon/Favorite.png" width="100px">
			<img id="wishList" alt="찜목록" src="resources/member/totalPage_icon/dibs.png" width="100px">
			<img id="coupons" alt="쿠폰함" src="resources/member/totalPage_icon/coupon.png" width="100px"><br>
				<a href="order_list"><img id="orderList" alt="주문목록" src="resources/member/totalPage_icon/order.png" width="100px"></a>
			<c:if test="${dto.mb_attribute =='크리에이터' || dto.mb_attribute == '관리자'}">
				<a href="store_management"><img id="product_management" alt="상품관리" src="resources/member/totalPage_icon/pretty_myFace.png" width="100px"></a>
			</c:if>
			<a href="shopping_cart_view"><img id="cart" alt="장바구니" src="resources/member/totalPage_icon/cart.png" width="100px"></a><br>
			<c:if test="${dto.mb_attribute =='크리에이터' || dto.mb_attribute == '관리자'}">
				<a href="store_order_management">주문관리</a>
			</c:if>
			<input type="hidden" name="id" value="${dto.mb_id }">
			<input type="hidden" name="mb_number" value="${dto.mb_number }">
		</div>
		
	</div>
</div>


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
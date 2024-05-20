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
.mypage_icon i {
	font-size: 5vw;
}
.mypage_1, .mypage_2, .mypage_3 {
	display: flex;
    justify-content: space-evenly;
    text-align: center;
    /* align-items: center; */
    gap: 16px;
}
.mypage_2, .mypage_3 {
	margin-top: 2vh;
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
			<div class="mypage_1">
				<div>
					<i class="fa-solid fa-star"></i><br>즐겨찾기<br>
				</div>
				<div>
					<i class="fa-solid fa-heart"></i><br>찜<br>
				</div>
				<div>
					<i class="fa-solid fa-ticket-simple"></i><br>쿠폰<br>
				</div>
			</div>
			<div class = "mypage_2">
				<div>
					<a href="order_list"><i class="fa-solid fa-bag-shopping"></i><br>주문목록</a><br>
				</div>
				<c:if test="${dto.mb_attribute =='크리에이터' || dto.mb_attribute == '관리자'}">
					<div>
						<a href="store_management"><i class="fa-solid fa-bars-progress"></i><br>상품관리</a><br>
					</div>
				</c:if>
				<div>
					<a href="shopping_cart_view"><i class="fa-solid fa-cart-shopping"></i><br>장바구니</a><br>
				</div>
			</div>
			
			<div class = "mypage_3">
				<c:if test="${dto.mb_attribute =='크리에이터' || dto.mb_attribute == '관리자'}">
					<div>
						<a href="store_order_management"><i class="fa-solid fa-list" ></i><br>주문관리</a><br>
					</div>
				</c:if>
			</div>
			
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
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<!-- JS -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js" defer></script>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js" defer></script>
<script type="text/javascript" src="resources/js/address.js" defer></script>
<script type="text/javascript" src="resources/js/gifthub_process.js" defer></script>
<!-- css -->
<link href="${pageContext.request.contextPath}/resources/css/gifthub/gifthub.css" rel="stylesheet" type="text/css">
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<section class="gifthub_container">
		<form action="gifthub_out" class="gift_form" method="post">
			<div class="gift_info">
			<h1>신청서 작성</h1>
			<div class="gift_info_detail">
				<div class="creator_info">
					<button onclick="creatorListPopup('creatorSelect','CreatorList',800,450)" class="search_button"> 선물 보낼 크리에이터 검색</button>
					<div id="select_creator"></div>
				</div>
				<div class="box_size">
					<select name="box_size" id="box_size">
					<option value="">박스사이즈 선택</option>
					<option value="소형">소형(+5,000)</option>
					<option value="중형">중형(+7,500)</option>
					<option value="대형">대형(문의)</option>
					</select>
				</div>
			    <div class="category">
			    	<select name="big_category" id="big_category" onchange="categoryList()">
			        <option value="">카테고리 선택</option>
			        <option value="IT/디지털/게임">IT/디지털/게임</option>
			        <option value="가전">가전</option>
			        <option value="식품">식품</option>
			        <option value="주방용품">주방용품</option>
			        <option value="생활용품">생활용품</option>
			        <option value="홈/인테리어/꽃">홈/인테리어/꽃</option>
			        <option value="패션/잡화/주얼리">패션/잡화/주얼리</option>
			        <option value="뷰티/케어">뷰티/케어</option>
			        <option value="완구/취미">완구/취미</option>
			        <option value="문구/오피스/도서">문구/오피스/도서</option>
			        <option value="스포츠/레져">스포츠/레져"</option>
			        <option value="반려동물">반려동물</option>
			        <option value="기타">기타</option>
			    	</select>
			    <div class="category">
				    <select name="mid_category" id="mid_category">
				        <option value="">카테고리 상세</option>
				    </select>
				</div>
				</div>
					<div><input type="text" name="detail_category" class="detail_category" id="detail_category" placeholder="상세 품목"></div>
					<input type="button" value="선물 추가" onclick="giftAdd()" class="add_button">
				</div> 
				<div class="gift_list">
					<h1>선택한 선물</h1>
					<div id="gift_orderlist" class="gift_orderlist"></div>
				</div>
				<div class="gift_address">
					<h1>발송지</h1>
					<div class="gift_address_detail">
						<input type="text" name="zip_code" class="address" id="sample4_postcode" placeholder="우편번호" >
						<input type="button" onclick="sample4_execDaumPostcode()" value="우편번호 찾기" class="buttons"><br> 
						<input type="text" name="dlvy_address" class="address" id="sample4_roadAddress" placeholder="도로명주소" required >
						<input type="text" name="dlvy_address_dong" class="address" id="sample4_jibunAddress" placeholder="지번주소" required>
						<span id="guide" style="color: #999; display: none"></span> 
						<input type="text" name="dlvy_detail" class="address_detail" id="sample4_detailAddress" placeholder="상세주소" required maxlength="50">
					</div>
				</div>
			</div>
			<div class="gift_price">
				<h1>최종 금액</h1>
				<div id="tot_price"></div>
			</div>
			<div class="buy">
				<h1>결제 방법</h1>
				<div>카드 계좌 기타 등등</div>
			</div>
			<div>
				<input type="submit" value="구매하기" class="buy_button">
			</div>
		</form>
	</section>
</body>

</html>
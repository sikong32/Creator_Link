<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<script type="text/javascript" src="resources/js/gifthub_process.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script type="text/javascript" src="resources/js/address.js"></script>
<script type="text/javascript">
<!--document.getElementById('find_creator').addEventListener('click', function() {
    fetch('/getCreator')
        .then(function(response) {
            return response.json(); // 응답을 JSON으로 변환
        })
        .then(function(creators) {
            var popup = window.open('', 'Creators', 'width=600,height=400');
            popup.document.write('<html><head><title>크리에이터 목록</title></head><body>');
            popup.document.write('<h1>크리에이터 목록</h1><ul>');
            creators.forEach(function(creator) {
                popup.document.write('<li>' + creator.name + '</li>'); // 예시: creator 객체의 name 속성
            });
            popup.document.write('</ul></body></html>');
        })
        .catch(function(error) {
            console.log('Error:', error);
        });
});-->
</script>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<form action="gifthub_out" method="post">
		<div>선물대상(크리에이터)(팝업 검색 기능 추가 중)</div>
		<input type="button" value="크리에이터 검색" onclick="find_creator()">
			<c:forEach items="${list}" var="c">
				<span><img src="resources/member/basic_photo/${c.mb_photo}">
				${c.mb_nick_name}
				<input type="hidden" value="${c.mb_addr}" name="delivery_address"></span>
			</c:forEach>
		<div>박스 사이즈</div>
			<div><select name="box_size" id="box_size">
				<option value="소형">소형(+5,000)</option>
				<option value="중형">중형(+7,500)</option>
				<option value="대형">대형(문의)</option></select>
			</div>
		<div>카테고리(상세 카테고리 초기화 수정해야 함)</div>
	    <div><select name="big_category" id="big_category" onchange="updateCategory()">
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
	    </select></div>
		<div>
		    <select name="mid_category" id="mid_category">
		        <option value="">카테고리 상세</option>
		    </select>
		</div>
		<div>상세품목</div>
			<div><input type="text" name="detail_category" id="detail_category"></div>
			<input type="button" value="추가하기" onclick="gift_add()">
		<div>선택한 선물 목록</div>
			<div id="gift_orderlist"></div>
		<div>최종 금액</div>
			<div id="tot_price"></div>
		<div>픽업 주소 </div>
		<input type="text" name="zip_code" id="sample4_postcode" placeholder="우편번호">
			<input type="button" onclick="sample4_execDaumPostcode()" value="우편번호 찾기"><br> 
			<input type="text" name="dlvy_address" id="sample4_roadAddress" placeholder="도로명주소" required>
			<input type="text" name="dlvy_address_dong" id="sample4_jibunAddress" placeholder="지번주소" required>
			<span id="guide" style="color: #999; display: none"></span> 
			<input type="text" name="dlvy_detail" id="sample4_detailAddress" placeholder="상세주소" required maxlength="50">
			<input type="text" name="dlvy_comment" placeholder="배송 메시지" maxlength="20">
		<div>결제 방법</div>
			<div>카드 계좌 기타 등등</div>
		<input type="submit" value="구매하기">
		<input type="reset" value="취소">
	</form>
</body>

</html>
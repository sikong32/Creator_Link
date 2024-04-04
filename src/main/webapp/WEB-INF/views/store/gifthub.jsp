<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<script type="text/javascript" src="resources/js/address.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script type="text/javascript">
<!-- 카테고리 (대분류, 중분류) -->
<!-- 나중에 DB연동 방식으로 바꿔 볼 예정 -->
var category = {
	    "IT/디지털/게임": ['저장장치', '카메라/웹캠/마이크', '케이블/연장선/더블잭', '프린터/공유기/소프트웨어', '게임기/게임팩/컨트롤러', '음향기기/헤드셋/이어폰', '스마트폰/스마트워치', '노트북/데스크탑/태블릿', '키보드/마우스/모니터'],
	    "가전": ['냉/난방 계절 가전', '주방가전', 'TV/영상가전', '건강가전/용품/의료기기', '냉장고/청소기', '미용가전', '생활가전', '세탁기/건조기'],
		"식품" : ['간식/과자/떡', '음료/커피/티/수제청','냉장/냉동/간편식','수산/육류/햄','건강식품','다이어트 식품','면/즉석밥/통조림','베이커리/케이크','쌀/견과','유기농/친환경/비건','유제품/아이스크림','장/양념/오일','채소/과일'],
		"주방용품" : ['주방/조리도구','컵/잔/텀블러','1회용품/종이컵','그릇','냄비/프라이팬','수저/커트러리','와인용품'],
		"생활용품" : ['세탁/청소/욕실 용품','위생용품','탈취/방향/디퓨저'],
		"홈/인테리어/꽃" : ['가구','조명/인테리어 무드등','침구/러그/커튼','쿠션/방석/패브릭소품','카페트/쿠션/실내화','인테리어 소품','꽃/식물/가드닝'],
		"패션/잡화/주얼리" : ['패션/의류','주얼리/시계','가방/잡화','명품','속옷/잠옷/수영복','신발/구두/운동화','코스튬/코스프레','패션액세서리'],
		"뷰티/케어" : ['메이크업/향수','네일/패디','뷰티 소품','스킨케어/클랜징','헤어/바디'],
		"완구/취미" : ['DIY/커스텀/굿즈','보드게임','계절완구','인형/피규어/프라모델','유아완구','파티/이벤트','퍼블/큐브/피젯토이','셀럽전용굿즈'],
		"문구/오피스/도서" : ['다이어리/플래너/컬러링북','필기류','앨범/바인더/파일','도서','노트/메모지'],
		"스포츠/레져" : ['등산/아웃도어/낚시','수영/수상용품','스포츠 잡화','캠핑/골프용품','킥보드/자전거/스케이트','헬스/요가/홈트용품'],
		"반려동물" : ['강아지 식사/간식/영양제','고양이 식사/간식/영양제','강아지 장난감','강아지 용품','고양이 용품','고양이 장난감','기타 동물 용품'],
		"기타": ['기타']
};
<!-- 대분류 선택시 중분류 업데이트 -->
function updateMidCategory() {
    var bigCategory = document.getElementById('big_category').value;
    var midCategorySelect = document.getElementById('mid_category');
    midCategorySelect.innerHTML = '<option value="">선택하세요.</option>'; // 중분류 초기화

    if (bigCategory && category[bigCategory]) {
        var midCategories = category[bigCategory];
        midCategories.forEach(function(midCategory) {
            var option = document.createElement('option');
            option.value = midCategory;
            option.text = midCategory;
            midCategorySelect.appendChild(option);
        });
    }
}
</script>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<form action="gifthub_out" method="post">
		<div>선물대상(크리에이터)</div>
		<div>크리에이터 검색기능 추가 예정</div>
			<c:forEach items="${list}" var="c">
				<span><img src="resources/member/basic_photo/${c.mb_photo}">
				${c.mb_nick_name}
				<input type="hidden" value="${c.mb_addr}" name="delivery_address"></span>
			</c:forEach>
		<div>박스 사이즈</div>
			<div><select name="box_size">
				<option value="small">소형(+3,000)</option>
				<option value="midum">중형(+5,000)</option>
				<option value="big">대형(문의)</option>
				</select>
			</div>
		<div>카테고리</div>
	    <div><select name="big_category" id="big_category" onchange="updateMidCategory()">
	        <option value="">선택하세요.</option>
	        <option value="IT/디지털/게임">IT/디지털/게임</option>
	        <option value="가전">가전</option>
	    </select></div>
		<div>
		    <select name="mid_category" id="mid_category">
		        <option value="">선택하세요.</option>
		    </select>
		</div>
		<div>상세품목</div>
			<div><input type="text" name="detail_category"></div>
			<input type="button" onclick="gift_add" value="추가하기">(박스사이즈,카테고리 빈칸 체크 / 선물항목 추가 / 계산)
		<div>선물 항목</div>
			<div>중분류 카테고리 / 상세 카테고리 / 금액</div>
			<input type="button" onclick="gift_delete">
		<div>최종 금액</div>
			<div>박스 가격 * 수량</div>
		
		<div>픽업 주소 </div>
			<div><input type="text" id="sample4_postcode" placeholder="우편번호">
				<input type="button" onclick="sample4_execDaumPostcode()" value="우편번호 찾기">
				<input type="text" id="sample4_roadAddress" placeholder="도로명주소">
				<input type="text" id="sample4_jibunAddress" placeholder="지번주소">
				<span id="guide" style="color:#999;display:none"></span>
				<input type="text" id="sample4_detailAddress" placeholder="상세주소">
			</div>
		<div>결제 방법</div>
			<div>카드 계좌 기타 등등</div>
		<input type="submit" value="구매하기">
		<input type="reset" value="취소">
	</form>
</body>
<script type="text/javascript" src="./js/address.js"></script>
</html>
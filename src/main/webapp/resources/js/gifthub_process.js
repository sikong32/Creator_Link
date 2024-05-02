// 팝업 창 생성 //
function creatorListPopup(url, name, width, height) {
    var left = (screen.width - width) / 2; /* 팝업을 화면 중앙에 배치하기 위해 추가 */
    var top = (screen.height - height) / 2; /* 팝업을 화면 중앙에 배치하기 위해 추가 */
    var options = 'width=' + width + ',height=' + height + ',top=' + top + ',left=' + left + ',scrollbars=yes';
    window.open(url, name, options);
}

// 팝업창에서 받아온 데이터 처리 //
function selectCreatorInfo(data) {
    var select_creator = document.getElementById('select_creator');
	if (data.photo === "basic_photo.png") {
	    photo_src = "basic_photo";
	} else {
	    photo_src = "profile";
	}
    var list = '<img src="resources/member/' + photo_src + '/' + data.photo + '" alt="Creator Photo">';
    list += '<span>' + data.nick_name + '</span>';
    list += '<input type="hidden" name="nick_name" value="' + data.nick_name + '">';
    list += '<input type="hidden" name="address_post" value="' + data.post + '">';
    list += '<input type="hidden" name="address_road" value="' + data.road + '">';
    list += '<input type="hidden" name="address_local" value="' + data.local + '">';
    list += '<input type="hidden" name="address_detail" value="' + data.detail + '">';
    select_creator.innerHTML = list;
}

// 카테고리 (대분류, 중분류) //
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

// 대분류 선택시 중분류 업데이트 //
function categoryList() {
var big_category = document.getElementById('big_category').value; /* 대분류 */
var mid_category = document.getElementById('mid_category'); /* 중분류 */
mid_category.innerHTML = '<option value="">선택하세요.</option>'; /* 중분류 초기화 옵션 */

// 중분류 목록 생성 //
if (big_category && category[big_category]) { /* bigCategory의 변수 값과 category[bigCategory] 값이 존재 할 때 실행 */
    var mid_categorys = category[big_category];
    mid_categorys.forEach(function(midcategorys) { /* 중분류의 개수만큼 반복 */
        var option = document.createElement('option'); /* 중분류를 저장 할 option 생성 */
        option.value = midcategorys; /* option의 값 = 중분류의 값 */
        option.text = midcategorys; /* option의 글자 = 중분류의 글자 */
        mid_category.appendChild(option); /* 생성된 option들을 중분류 변수에 저장 */
    });
}
}

// 박스 사이즈, 카테고리 빈칸 체크 //
function check(){
var box_size = document.getElementById('box_size').value; /* 박스 사이즈 */
var big_category = document.getElementById('big_category').value; /* 대분류 */
var mid_category = document.getElementById('mid_category').value; /* 중분류 */
var detail_category = document.getElementById('detail_category').value; /* 상세 품목 */
var detail_cateCh = /^[a-zA-Zㄱ-ㅎ가-힣0-9\s]{1,15}$/;
if (!box_size) {
    alert('박스 사이즈를 선택해주세요.');
    return false;
} 
else if (!big_category) {
    alert('카테고리를 선택해주세요.');
    return false;
} else if (!mid_category) {
    alert('상세 카테고리를 선택해주세요.');
    return false;
} else if (!detail_category) {
    alert('상세 품목을 입력해주세요.');
    return false;
} else if (!detail_cateCh.test(detail_category)) {
    alert('상세 품목은 영 대/소문자,한글,숫자,공백 1~15자 이내로 작성해주세요.');
    console.log("입력 값: ", detail_category); // 입력 값 확인
	console.log("정규식 검사 결과: ", detail_cateCh.test(detail_category)); // 정규식 검사 결과 확인
    return false;
}
return true;
}

// 총 합계 //
var tot_price = 0;
// 선물 목록 //
function giftAdd() {
if (check()) { /* if문은 true일 때 실행 됨 (즉, check 함수의 값이 true일 때 실행되는 조건) */
    var big_category = document.getElementById('big_category').value;
    var mid_category = document.getElementById('mid_category').value;
    var box_size = document.getElementById('box_size').value;
    var detail_category = document.getElementById('detail_category').value;
    
    // 선물 항목 당 금액 //
    var gift_price;
    if (box_size === '소형'){
        gift_price = 5000;
    }
    else if (box_size === '중형'){
        gift_price = 7500;
    }
    else {
        alert('대형 박스는 고객센터로 문의 부탁드립니다')
        return false;
    }
    
    // 선물 목록 생성 //
    var gift_orderlist = document.getElementById('gift_orderlist'); /* 선물 전체 목록 */
    var gift_list = document.createElement('div'); /* 선물 항목 (선물 정보 + 삭제 버튼) */
    
    // 선물 정보에 넣을 요소 추가 (대분류, 중분류, 박스 크기, 상세품목, 상품 금액) //
    giftInfo(big_category, 'big_category', gift_list);
    giftInfo(mid_category, 'mid_category', gift_list);
    giftInfo(detail_category, 'detail_category', gift_list);
    giftInfo(box_size, 'box_size', gift_list);
    giftInfo(gift_price, 'gift_price', gift_list);
    
    // 삭제 버튼 생성 //
    var delete_btn = document.createElement('button'); /* 선물 취소 (목록에서 삭제) 버튼 생성 */
    delete_btn.type = 'button'; /* type을 버튼으로 변경 (그냥 button은 모든 클릭을 submit으로 인식 -> 취소 클릭 시 오류 발생) */
    gift_list.appendChild(delete_btn) /* 선물 항목에 삭제 버튼 추가 */
    delete_btn.textContent = '취소하기';
    delete_btn.onclick = function() { /* 삭제 버튼 클릭 시 확인 창 */
        var check_btn = confirm('선택한 항목을 삭제하시겠습니까?'); /* 확인 클릭 시 true 반환 */
        if(check_btn) {
            tot_price -= gift_price; /* 전체 가격 - 선물 가격 */
            gift_orderlist.removeChild(gift_list);
            updateTotalPrice(); /* 전체 금액 갱신 */
        }
    };
    
    // 선물 정보 추가 //
    if(gift_orderlist.childElementCount < 2) { /* gift_list의 수가 2미만인 경우에만 추가*/
    	gift_orderlist.appendChild(gift_list); /* 목록에 상품 정보 추가 */
    	tot_price += gift_price; // 전체 가격 + 선물 가격
    	var tot_gift_price = document.getElementById('tot_price');
   		tot_gift_price.textContent = tot_price.toLocaleString(); /* 천단위마다 쉼표 표시해주기 위해 toLocaleString() 사용 */
    }
	else {
		alert('한 번에 주문 가능한 선물의 개수는 최대 2개 입니다')
	}
    
}
}

// 선물 정보 생성 //
function giftInfo(value, name, parent){
	var input = document.createElement('input');
	input.setAttribute('name', name);
	input.setAttribute('value', value);
	input.setAttribute('type', 'hidden');
	parent.appendChild(input);
	
	var span = document.createElement('span');
	span.textContent = value;
	parent.appendChild(span);
}

// 최종 금액 업데이트 //
function updateTotalPrice() {
var tot_gift_price = document.getElementById('tot_price');
tot_gift_price.textContent = tot_price.toLocaleString();
}

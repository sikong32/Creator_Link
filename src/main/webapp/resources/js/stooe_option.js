var option1Count = 1;
var option2Count = 1;
var option3Count = 1;
var optionCategoryCount = 0;

function addOptionCategory() { // 옵션 카테고리 추가
	if(optionCategoryCount>2){
		alert("옵션 카테고리 개수는 최대 3개까지 입니다.");
	}else{
    optionCategoryCount++; // 옵션 카테고리 누적
    var container = document.getElementById('optionCategories'); // 만들 태그 위치 찾기
    var div = document.createElement('div'); // 만들 태그
    div.setAttribute("name",'optionCategory'); // 태그 네임 명
    div.id = 'optionCategory_' + optionCategoryCount; // 태그 id 설정
    // 만들 태그에 들어갈 내용
    div.innerHTML = '옵션 카테고리 ' + optionCategoryCount +
					'<li><div name="optionsContainer'+ optionCategoryCount +'" id="optionsContainer'+ optionCategoryCount +'"></div>' +
					'<input type="button" onclick="addOption'+ optionCategoryCount +'()" value="옵션 추가"></li>';
	var delete_Button = document.createElement('input'); // 만들 태그의 속성
    delete_Button.type = "button"; // 만들 태그의 타입
    delete_Button.value = '마지막 옵션 카테고리 제거'; // 만들 태그의 값
    delete_Button.onclick = function() { // 만들 태그의 함수
        OptionCategory_delete('optionCategory_' + optionCategoryCount); //옵션 카테고리 삭제 함수에 현재 선택된 옵션 카테로기 id 값 전송
    	optionCategoryCount --; // 옵션 카테고리 누적 함수 -1
    };
    div.appendChild(delete_Button);// 옵션 카테고리에 삭제 버튼 추가
    container.appendChild(div); // 옵션 카테고리 HTML 영역에 생성
    
	// 생성된 옵션 카테고리의 처음 1개의 옵션 생성
    var container = document.getElementById('optionsContainer'+optionCategoryCount); 
    var div = document.createElement('div');
    div.setAttribute("name","option"+optionCategoryCount);
    div.id= 'option1'+ optionCategoryCount;
    div.innerHTML = '1옵션 이름: <input type="text" id="os_1name" name="os_1name" >' + 
				    '1옵션 가격: <input type="text"	id="os_1price" name="os_1price" >' +
				    '1옵션 사진: <input type="file"	id="os_1photo" name="os_1photo" >' +
				    '1옵션 재고: <input type="number" min="0"	id="os_1stock" name="os_1stock" onchange="tot_stock()" class="stock">';
    container.appendChild(div);
	}
}

function OptionCategory_delete(categoryId) { // 옵션 카테고리 삭제 함수
    var category = document.getElementById(categoryId);
//     alert(categoryId);
    if (category) {
    	//각 옵션 카테고리의 ID를 찾아 옵션으 카운트를 초기화
    	if(categoryId.slice(-1)==='1'){
    		option1Count = 1;
    	}else if(categoryId.slice(-1)==='2'){
    		option2Count = 1;
    	}else if(categoryId.slice(-1)==='3'){
    		option3Count = 1;
    	}
        category.remove();//선택된 옵션 카테고리 삭제
    }
}
function addOption1() { // 옵션 생성
	if(option1Count>9){ // 최대 옵션 수 제한
		alert("옵션 개수는 최대 10개까지 입니다.");
	}else{
	option1Count++; // 옵션 수 누적
    var container = document.getElementById('optionsContainer1'); //옵션 생성 위치 파악
    var div = document.createElement('div'); // 옵션 생성 태그 설정
    div.setAttribute("name",'option1'); // 옵션 태그 네임명 설정
    div.id= 'option1'+ option1Count; // 옵션 태그 ID명
 	// 옵션 태그 에 들어갈 내용
    div.innerHTML = option1Count +'옵션 이름: <input type="text" id="os_'+ option1Count +'name" name="os_1'+ option1Count +'name" >' + 
				    option1Count +'옵션 가격: <input type="text"	id="os_'+ option1Count +'price" name="os_1'+ option1Count +'price" >' +
				    option1Count +'옵션 사진: <input type="file"	id="os_'+ option1Count +'photo" name="os_1'+ option1Count +'photo" >' +
				    option1Count +'옵션 재고: <input type="number" min="0"	id="os_'+ option1Count +'stock" name="os_1'+ option1Count +'stock" onchange="tot_stock()" class="stock">';
    var deleteButton = document.createElement('input');//삭제 버튼 생성 input 태그로
    deleteButton.type = "button";
    deleteButton.value = '마지막 옵션 제거';
    deleteButton.onclick = function() {
    	removeOption('option1'+option1Count);
    	option1Count --;
    };
    div.appendChild(deleteButton);
    container.appendChild(div);
	}
}
function addOption2() { // 2번 옵션 카테고리에 옵션 생성 함수
	if(option2Count>9){
		alert("옵션 개수는 최대 10개까지 입니다.");
	}else{
	option2Count++;
    var container = document.getElementById('optionsContainer2');
    var div = document.createElement('div');
    div.setAttribute("name",'option2');
    div.id= 'option2'+ option2Count;
    div.innerHTML = option2Count +'옵션 이름: <input type="text" id="os_'+ option2Count +'name" name="os_2'+ option2Count +'name" >' + 
				    option2Count +'옵션 가격: <input type="text"	id="os_'+ option2Count +'price" name="os_2'+ option2Count +'price" >' +
				    option2Count +'옵션 사진: <input type="file"	id="os_'+ option2Count +'photo" name="os_2'+ option2Count +'photo" >' +
				    option2Count +'옵션 재고: <input type="number" min="0"	id="os_'+ option2Count +'stock" name="os_2'+ option2Count +'stock" onchange="tot_stock()" class="stock">' ;
	var deleteButton = document.createElement('input');
    deleteButton.type = "button";
    deleteButton.value = '마지막 옵션 제거';
    deleteButton.onclick = function() {
    	removeOption('option2'+option2Count);
    	option2Count --;
    };
    div.appendChild(deleteButton);
    container.appendChild(div);
	}
}
function addOption3() {// 3번 옵션 카테고리에 옵션 생성 함수
	if(option3Count>9){
		alert("옵션 개수는 최대 10개까지 입니다.");
	}else{
    option3Count++;
    var container = document.getElementById('optionsContainer3');
    var div = document.createElement('div');
    div.setAttribute("name",'option3');
    div.id= 'option3'+ option3Count;
    
        div.innerHTML = option3Count +'옵션 이름: <input type="text" id="os_'+ option3Count +'name" name="os_3'+ option3Count +'name" >' + 
                        option3Count +'옵션 가격: <input type="text"	id="os_'+ option3Count +'price" name="os_3'+ option3Count +'price" >' +
                        option3Count +'옵션 사진: <input type="file"	id="os_'+ option3Count +'photo" name="os_3'+ option3Count +'photo" >' +
                        option3Count +'옵션 재고: <input type="number" min="0"	id="os_'+ option3Count +'stock" name="os_3'+ option3Count +'stock" onchange="tot_stock()" class="stock">' ;
        var deleteButton = document.createElement('input');
        deleteButton.type = "button";
        deleteButton.value = '마지막 옵션 제거';
        deleteButton.onclick = function() {
            removeOption('option3'+option3Count);
            option3Count --;
        };
        div.appendChild(deleteButton);
        container.appendChild(div);
	 
    }
}
//옵션 삭제 버튼
function removeOption(id) { 
		var option = document.getElementById(id);
		if(option){
			option.remove();
		}
}
// 옵션 재고 실시간 전체 재고에 반영
function tot_stock() {
	// 모든 os_stock 요소를 가져옴
    var os_stocks = document.getElementsByClassName('stock');
    // 총 재고를 저장할 변수 초기화
    var totstock = 0;

    // 각 요소의 값을 합산
    for (var i = 0; i < os_stocks.length; i++) {
	    var element = os_stocks[i];
	    var value = parseInt(element.value) || 0; // 요소의 값을 정수로 변환 (값이 숫자가 아니거나 없으면 0으로 설정됨)
	    totstock += value; // 총 재고에 해당 요소의 값을 더함
	}
    // 재고의 총합을 계산하여 pd_stock 요소의 값으로 설정
    document.getElementById('pd_stock').value = totstock;
}
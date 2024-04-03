var is_os_category = false;
function os_Category_create() {
	if(!is_os_category){
		var Categorie = document.getElementById('os_Categories');
		var div = document.createElement('div');
		div.id = "os_Category"; // 태그 id 설정
		// 만들 태그에 들어갈 내용
		div.innerHTML = '<select name="os_su" id="os_su" onchange="os_Category(this)"><option value="1">옵션 카테고리1</option><option value="2">옵션 카테고리2</option><option value="3">옵션 카테고리3</option></select>' +
			'<input type="button" onclick="os_list()" value="옵션 카테고리 적용">';
		Categorie.appendChild(div);
		os_Category(document.getElementById('os_su'));
		is_os_category = true;
	}
}
// 옵션 카테고리 추가
function os_Category(os_su) {
	//옵션 초기화
	var container = document.getElementById('os_print');
	container.innerHTML = '';
	for (var i = 1; i <= os_su.value; i++) {
		var container = document.getElementById('os_print'); // 만들 태그 위치 찾기
		var div = document.createElement('div'); // 만들 태그
		div.id = 'os_print_child'; // 태그 id 설정
		// 만들 태그에 들어갈 내용
		div.innerHTML = '옵션 카테고리 ' + i +
			'<input type="hidden" name="os1_su">' +
			'옵션 이름: <input type="text" id="os_' + i + 'name" name="os_1' + i + 'name" placeholder="예: S,M,L 구분자,">';
		container.appendChild(div); // 옵션 카테고리 HTML 영역에 생성
	};
}

function os_list() { // 여기가 입력
	var os_out = document.getElementById('os_out');
	os_out.innerHTML = ""; //전에 생성된 내용 초기화

	var div = document.createElement('div');
	div.id = "os_out_child"; // 태그 id 설정

	if (document.getElementById("os_1name") != null) {
		var field1Values = document.getElementById("os_1name").value.split(",").filter(function (value) {
			return value.trim() !== ""; // 공백이 아닌 값만 필터링
		});
	} else {
		field1Values = [];
	}

	if (document.getElementById("os_2name") != null) {
		var field2Values = document.getElementById("os_2name").value.split(",").filter(function (value) {
			return value.trim() !== ""; // 공백이 아닌 값만 필터링
		});
	} else {
		field2Values = [];
	}

	if (document.getElementById("os_3name") != null) {
		var field3Values = document.getElementById("os_3name").value.split(",").filter(function (value) {
			return value.trim() !== ""; // 공백이 아닌 값만 필터링
		});
	} else {
		field3Values = [];
	}
	if (field1Values.length >= 10) {
		alert("입력하신 1번 옵션의 수가 10개를 초과 했습니다.");
		return;
	} else if (field2Values.length >= 10) {
		alert("입력하신 2번 옵션의 수가 10개를 초과 했습니다.");
		return;
	} else if (field3Values.length >= 10) {
		alert("입력하신 3번 옵션의 수가 10개를 초과 했습니다.");
		return;
	}
	var result = "";
	var os_su = 0;
	// 타이틀 출력
	if (field1Values.length > 0) {
		if (field2Values.length > 0) {
			if (field3Values.length > 0) {
				result += '<table><tr><th>옵션 값1</th>'
					+ '<th>옵션 값2</th>'
					+ '<th>옵션 값3</th>'
					+ '<th>가격</th>'
					+ '<th>재고</th>'
					+ '<th>사진</th></tr>';

			} else {
				result += '<table><tr><th>옵션 값1</th>'
					+ '<th>옵션 값2</th>'
					+ '<th>가격</th>'
					+ '<th>재고</th>'
					+ '<th>사진</th></tr>';
			}
		} else {
			result += '<table><tr><th>옵션 값1</th>'
				+ '<th>가격</th>'
				+ '<th>재고</th>'
				+ '<th>사진</th></tr>';
		}
	}
	// 값 출력
	if (field1Values.length > 0) {
		field1Values.forEach(function (value1) {
			if (field2Values.length > 0) {
				field2Values.forEach(function (value2) {
					if (field3Values.length > 0) {
						field3Values.forEach(function (value3) {
							os_su++;
							result += '<tr>'
								+ '<td class="os_td"><input class="os_input" type="text" name="os_1_' + os_su + '" value="' + value1 + '" required maxlength="100"></td>'
								+ '<td class="os_td"><input class="os_input" type="text" name="os_2_' + os_su + '" value="' + value2 + '" required maxlength="100"></td>'
								+ '<td class="os_td"><input class="os_input" type="text" name="os_3_' + os_su + '" value="' + value3 + '" required maxlength="100"></td>'
								+ '<td class="os_td"><input class="os_input" type="number" name="os_' + os_su + 'price" placeholder="옵션의 최종 판매가격"></td>'
								+ '<td class="os_td"><input class="os_input_stock" type="number" name="os_' + os_su + 'stock" onchange="tot_stock()" min="0" max="9999999999"></td>'
								+ '<td class="os_td"><input class="os_input" type="file" name="os_' + os_su + 'photo"></td>'
								+ '</tr>';
						});
					} else {
						os_su++;
						result += '<tr><td class="os_td"><input class="os_input" type="text" name="os_1_' + os_su + '" value="' + value1 + '" required maxlength="100"></td>'
							+ '<td class="os_td"><input class="os_input" type="text" name="os_2_' + os_su + '" value="' + value2 + '" required maxlength="100"></td>'
							+ '<td class="os_td"><input class="os_input" type="number" name="os_' + os_su + 'price"></td>'
							+ '<td class="os_td"><input class="os_input_stock" type="number" name="os_' + os_su + 'stock" onchange="tot_stock()" min="0" max="9999999999"></td>'
							+ '<td class="os_td"><input class="os_input" type="file" name="os_' + os_su + 'photo"></td>'
							+ '</tr>';
					}
				});
			} else {
				os_su++;
				result += '<tr><td class="os_td"><input class="os_input" type="text" name="os_1_' + os_su + '" value="' + value1 + '" required maxlength="100"></td>'
					+ '<td class="os_td"><input class="os_input" type="number" name="os_' + os_su + 'price"></td>'
					+ '<td class="os_td"><input class="os_input_stock" type="number" name="os_' + os_su + 'stock" onchange="tot_stock()" min="0" max="9999999999"></td>'
					+ '<td class="os_td"><input class="os_input" type="file" name="os_' + os_su + 'photo"></td>'
					+ '</tr>';
			}
		});
	}
	result += "</table><input type='hidden' name='os_print_su' value=" + os_su + ">";
	div.innerHTML = result;
	os_out.appendChild(div);
}

// 옵션 재고 전체 재고에 반영
function tot_stock() {
	// 모든 os_stock 요소를 가져옴
	var os_stocks = document.getElementsByClassName('os_input_stock');
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
function os_Category_delete() { // 옵션 카테고리 삭제 함수
	if (document.getElementById("os_Category") != null) {
		var categorys = document.getElementById("os_Category");
		categorys.remove();
	}
	if (document.getElementById("os_print") != null) {
		var os_print = document.getElementById("os_print");
		while (os_print.firstChild) {
			os_print.removeChild(os_print.firstChild);
		}
	}
	if (document.getElementById("os_out_child") != null) {
		var option_list = document.getElementById("os_out_child");
		while (option_list.firstChild) {
			option_list.removeChild(option_list.firstChild);
		}
	}
	is_os_category = false;
}
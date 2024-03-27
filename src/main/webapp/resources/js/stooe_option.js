var option1Count = 0;
var option2Count = 0;
var option3Count = 0;
var option_delete_button_count = 0;

function addOption1() {
    option1Count++;
    var container = document.getElementById('optionsContainer1');
    var div = document.createElement('div');
    div.className = 'option1';
    div.id= 'option1'+ option1Count;
    div.innerHTML = option1Count +'옵션 이름: <input type="text" id="os_'+ option1Count +'name" name="os_'+ option1Count +'name" >' + 
				    option1Count +'옵션 가격: <input type="text"	id="os_'+ option1Count +'price" name="os_'+ option1Count +'price" >' +
				    option1Count +'옵션 사진: <input type="file"	id="os_'+ option1Count +'photo" name="os_'+ option1Count +'photo" >' +
				    option1Count +'옵션 재고: <input type="number" min="0"	id="os_'+ option1Count +'stock" name="os_'+ option1Count +'stock" >';
    var deleteButton = document.createElement('input');
    deleteButton.type = "button";
    deleteButton.value = '마지막 옵션 제거';
    deleteButton.onclick = function() {
    	removeOption('option1'+option1Count);
    	option1Count --;
    };
    div.appendChild(deleteButton);
    container.appendChild(div);
}
function addOption2() {
	option2Count++;
    var container = document.getElementById('optionsContainer2');
    var div = document.createElement('div');
    div.className = 'option2';
    div.id= 'option2'+ option2Count;
    div.innerHTML = option2Count +'옵션 이름: <input type="text" id="os_'+ option2Count +'name" name="os_'+ option2Count +'name" >' + 
				    option2Count +'옵션 가격: <input type="text"	id="os_'+ option2Count +'price" name="os_'+ option2Count +'price" >' +
				    option2Count +'옵션 사진: <input type="file"	id="os_'+ option2Count +'photo" name="os_'+ option2Count +'photo" >' +
				    option2Count +'옵션 재고: <input type="number" min="0"	id="os_'+ option2Count +'stock" name="os_'+ option2Count +'stock" >' ;
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
function addOption3() {
    option3Count++;
    var container = document.getElementById('optionsContainer3');
    var div = document.createElement('div');
    div.className = 'option3';
    div.id= 'option3'+ option3Count;
    div.innerHTML = option3Count +'옵션 이름: <input type="text" id="os_'+ option3Count +'name" name="os_'+ option3Count +'name" >' + 
				    option3Count +'옵션 가격: <input type="text"	id="os_'+ option3Count +'price" name="os_'+ option3Count +'price" >' +
				    option3Count +'옵션 사진: <input type="file"	id="os_'+ option3Count +'photo" name="os_'+ option3Count +'photo" >' +
				    option3Count +'옵션 재고: <input type="number" min="0"	id="os_'+ option3Count +'stock" name="os_'+ option3Count +'stock" >' ;
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

function removeOption(id) {
		var option = document.getElementById(id);
		if(option){
			option.remove();
		}
}

var optionCategoryCount = 0;

function addOptionCategory() {
	if(optionCategoryCount>2){
		alert("옵션 개수는 최대 3개까지 입니다.");
	}else{
    optionCategoryCount++;
    var container = document.getElementById('optionCategories');
    var div = document.createElement('div');
    div.className = 'optionCategory';
    div.id = 'optionCategory_' + optionCategoryCount;
    div.innerHTML = '옵션 부류 ' + optionCategoryCount +
					'<li><div id="optionsContainer'+ optionCategoryCount +'"></div>' +
					'<input type="button" onclick="addOption'+ optionCategoryCount +'()" value="옵션 추가"></li>';
	var delete_Button = document.createElement('input');
    delete_Button.type = "button";
    delete_Button.value = '마지막 옵션 부류 제거';
    delete_Button.onclick = function() {
        OptionCategory_delete('optionCategory_' + optionCategoryCount);
    	optionCategoryCount --;
    };
    div.appendChild(delete_Button);
    container.appendChild(div);
	}
}

function OptionCategory_delete(categoryId) {
    var category = document.getElementById(categoryId);
    if (category) {
        category.remove();
    }
}
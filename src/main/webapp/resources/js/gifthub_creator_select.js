// popup 창 생성 //
function creatorListPopup() {
    var popup = window.open('', 'CreatorList', 'width=800, height=600, scrollbars=yes');
    popup.document.write('<html><head><title>크리에이터 목록</title></head><body><h1>크리에이터 목록</h1>');
    popup.document.write('<input type="text" id="search_keyword" placeholder="검색 할 닉네임 입력">');
    popup.document.write('<button onclick="searchCreator(window)">검색</button><ul id="creator_list"></ul></body></html>');
    /* window : 현재 열려 있는 팝업 창에서 메소드 기능 실행하라는 의미 */
    popupScript(popup); /* 변수 popup에 있는 요소로 실행되는 메소드이기 때문에 popup 전달 */
    popup.document.close();
}

// popup 창에서 사용되는 script 변수 //
function popupScript(popup) {
	
	/* popup은 기존 페이지와 독립적이라는 특성을 가지고 있음
	따라서 popup에서 작동하는 script는 popup 내부에 작성해줘야 제대로 작동됨 */
    var script = popup.document.createElement('script');
    script.type = 'text/javascript';
    script.text = `

    	// 검색 처리 과정 //
        function searchCreator(popup) {
            var keyword = popup.document.getElementById('search_keyword').value.trim(); /* trim : 공백 제거 */
	        if (!keyword) { /* 키워드가 공백이면 */
	        popup.document.getElementById('creator_list').innerHTML = '<p>검색어를 입력해 주세요.</p>';
	        return;
    	}
            fetch('searChcreator?keyword=' + encodeURIComponent(keyword), { headers: { 'Accept': 'application/json' } })
            /* encodeURIComponent : url에서 특수문자들은 기능을 가지고 있음. (특수문자 중 %는 아무 기능 없음)
    		따라서 keyword에 특수 문자가 포함될 경우 %로 인코딩해서 오류를 방지해주는 기능의 함수 */
            .then(response => response.json())
            .then(data => {
            	searchCreatorResult(popup, data);
            })
            .catch(error => {
                console.error('Error:', error);
                popup.document.getElementById('creator_list').innerHTML = '오류가 발생했습니다. 다시 시도해 주세요.';
            });
    	}
        
    	// 검색 결과 출력 //
        function searchCreatorResult(popup, data) {
            var list = '';
            if (data && data.length > 0) { /* data가 존재할 때 검색 결과 표시 */
                data.forEach(function(creator) {
                    list += '<li><img src="resources/member/basic_photo/' + creator.mb_photo + '"></li>';
                    list += '<li>' + creator.mb_nick_name + '</li>';
                    list += '<button class="select_creator" data-nick="' + creator.mb_nick_name + 
                    '" data-photo="' + creator.mb_photo + 
                    '" data-post="' + creator.mb_addr_post +
                    '" data-road="' + creator.mb_addr_road + 
                    '" data-local="' + creator.mb_addr_local + 
                    '" data-detail="' + creator.mb_addr_detail + '">선택</button>';
                });
            	popup.document.getElementById('creator_list').innerHTML = list;
                selectCreator(popup);
            } 
            else { /* data가 존재하지 않을 때 출력될 문구 */
                list = '<p>검색 결과가 없습니다.</p>';
                popup.document.getElementById('creator_list').innerHTML = list;
        	}
    	}
       
       // 선택 버튼 클릭 시 작동 //
       function selectCreator(popup) {
	    var buttons = popup.document.querySelectorAll('.select_creator'); /* 이름이 select_creator인 것 모두 선택 */
	    buttons.forEach(function(button) {
        button.addEventListener('click', function() {
            var nick_name = this.getAttribute('data-nick');
            var photo = this.getAttribute('data-photo');
            var address = {
                post: this.getAttribute('data-post'),
                road: this.getAttribute('data-road'),
                local: this.getAttribute('data-local'),
                detail: this.getAttribute('data-detail')
            };

            // 부모 창 함수 호출
            if (window.opener && !window.opener.closed) {
                window.opener.selectCreatorInfo(nick_name, photo, address);
                window.close(); // 선택 후 팝업 창 닫기
            }
        });
    });
    }`;
    popup.document.head.appendChild(script); /* popup창 head에 script를 추가하는 기능 */
}

function selectCreatorInfo(nick_name, photo, address) {
    var select_creator = document.getElementById('select_creator');
    var list = '<div><img src="resources/member/basic_photo/' + photo + '" alt="Creator Photo"><div>';
    list += '<span>' + nick_name + '</span>';
    list += '<input type="hidden" name="nick_name" value="' + nick_name + '">';
    list += '<input type="hidden" name="address_post" value="' + address.post + '">';
    list += '<input type="hidden" name="address_road" value="' + address.road + '">';
    list += '<input type="hidden" name="address_local" value="' + address.local + '">';
    list += '<input type="hidden" name="address_detail" value="' + address.detail + '">';
    select_creator.innerHTML = list;
}

// 검색 처리 과정 //
function searchCreator() {
	/* 기본적으로 출력되는 list 숨김 */
	var list = document.getElementById('basic_creator_list');
    list.style.display = 'none';
    
    var keyword = document.getElementById('search_keyword').value.trim(); /* trim : 공백 제거 */
	    if (!keyword) { /* 키워드가 공백이면 */
		    document.getElementById('creator_list').innerHTML = '<p>검색어를 입력해 주세요.</p>';
		    return;
		}
    fetch('searChcreator?keyword=' + encodeURIComponent(keyword), { headers: { 'Accept': 'application/json' } })
    /* encodeURIComponent : url에서 특수문자들은 기능을 가지고 있음. (특수문자 중 %는 아무 기능 없음)
    따라서 keyword에 특수 문자가 포함될 경우 %로 인코딩해서 오류를 방지해주는 기능의 함수 */
    .then(response => response.json())
    .then(data => {
        searchCreatorResult(data);
    })
    .catch(error => {
        console.error('Error:', error);
        document.getElementById('creator_list').innerHTML = '오류가 발생했습니다. 다시 시도해 주세요.';
    });
}

// 검색 결과 출력 //
function searchCreatorResult(data) {
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
        document.getElementById('creator_list').innerHTML = list;
        selectCreator();
    } 
    else { /* data가 존재하지 않을 때 출력될 문구 */
        list = '<p>검색 결과가 없습니다.</p>';
        document.getElementById('creator_list').innerHTML = list;
    }
}

// 선택 버튼 클릭 시 작동 //
function selectCreator() {
    var buttons = document.querySelectorAll('.select_creator'); /* 이름이 select_creator인 것 모두 선택 */
    buttons.forEach(function(button) {
        button.addEventListener('click', function() {
            var nick_name = this.getAttribute('data-nick');
            var photo = this.getAttribute('data-photo');
            var post = this.getAttribute('data-post');
            var road = this.getAttribute('data-road');
            var local = this.getAttribute('data-local');
            var detail = this.getAttribute('data-detail');
            

            // 부모 창에 데이터 전달 //
            window.opener.selectCreatorInfo({
                nick_name: nick_name,
                photo: photo,
                post : post,
                road : road,
                local : local,
                detail : detail
            });
            
            window.close();
        });
    });
}
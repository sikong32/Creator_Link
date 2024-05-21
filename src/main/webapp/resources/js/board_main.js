$(document).ready(function() {
	if (localStorage.getItem('modifyState') === 'active') {
		page_modify();
	}
	$("#list_add").click(function() {
		if (login_number == mb_number || mb_attribute == '관리자'){
			$.ajax({
				type : "post",
				async : true,
				url : "board_list_add",
				data : {
					"mb_number":mb_number
				},
				success : function(result) {
					location.reload();
				},
				error : function() {
					alert("실패");
				}
			});
		}
		else{
		}
	});
	$("[id^=list_del_]").each(function() {
		if (login_number == mb_number || mb_attribute == '관리자'){
			$(this).click(function() {
				var bat_number = $(this).data('bat_number');
				$.ajax({
					type : "post",
					async : true,
					url : "board_list_del",
					data : {
						"bat_number":bat_number
					},
					success : function(result) {
						location.reload();
					},
					error : function() {
						alert("실패");
					}
				});
			});
		}
		else{
		}
	});
	$("[id^=input_]").each(function() {
		$(this).blur(function() {
			var bat_number = $(this).data('bat_number');
			var bat_cls = $(this).val();
			$.ajax({
				type : "post",
				async : true,
				url : "board_list_modi",
				data : {
					"bat_number":bat_number,
					"bat_cls":bat_cls
				},
				success : function(result) {
					location.reload();
				},
				error : function() {
					alert("실패");
				}
			});
		});
	});
	$("#post_del").click(function() {
		if (login_number == mb_number || mb_attribute == '관리자'){
			var checked_post = $('.post_check:checked').map(function() {
				return $(this).val();
			}).get();
			if (checked_post.length > 0) {
				$.ajax({
					type : "post",
					url : "board_list_delete",
					async : true,
					data : {
						"bct_content_number":checked_post
					},
					traditional : true,
					success : function(result) {
						location.reload();
					},
					error : function() {
						alert("실패");
					}
				});
			}
			else{
				alert("삭제할 항목을 선택해주십시오");
			}
		}
		else{
		}
	});
	$("[id^=history_del_]").each(function() {
		$(this).click(function() {
			var mb_number = $(this).data('mb_number');
			$.ajax({
				type : "post",
				async : true,
				url : "history_del",
				data : {
					"mb_number":mb_number
				},
				success : function(result) {
					location.reload();
				},
				error : function() {
					alert("실패");
				}
			});
		});
	});
});

function change_vpp(selval) {
	var view_per_page = selval.value;
	window.location = "board_main?view_per_page="+view_per_page+batParams+searchParams+modeParams;
}
function search_do() {
	var search = document.getElementById('search').value;
    var value = document.getElementById('value').value;
    if (value != ""){
		window.location.href="board_main?search="+search+"&value="+value+"&view_per_page="+view_per_page+batParams;
    }
}
function board_write() {
	if (state == "true"){
		window.location.href="board_write?mb_number="+mb_number;
	}
	else{
		alert("로그인후 작성해주십시오");
	}
}
function toggleSettings(active) {
	var modibt = document.getElementById('modi_button');
    var submitbt = document.getElementById('submit_button');
    var addbt = document.getElementById('list_add');
    modibt.style.display = active ? "none" : "block";
    submitbt.style.display = active ? "block" : "none";
    addbt.style.display = active ? "block" : "none";
    toggle_list_del(active);
    toggle_post_del(active);
}
function toggle_list_del(show) {
	for (var i = 0; i < attribute_list_size; i++) {
		var list_del_num = document.getElementById('list_del_' + i);
		if (list_del_num) {
			list_del_num.style.display = show ? 'block' : 'none';
		}
	}
}
function page_modify() {
	if (login_number == mb_number || mb_attribute == '관리자'){
		localStorage.setItem('modifyState', 'active');
		toggleSettings(true);
		$('.category').each(function(index) {
			$('#text_' + index).hide();
			$('#input_' + index).show();
		});
	}
	else{
		localStorage.removeItem('modifyState');
	}
}
function submit_do() {
	if (login_number == mb_number || mb_attribute == '관리자'){
		localStorage.removeItem('modifyState');
		toggleSettings(false);
		$('.category').each(function(index) {
			var inputVal = $('#input_' + index).val();
			$('#text_' + index).text(inputVal).show();
			$('#input_' + index).hide();
		});
	}
	else{
		alert("권한없음");
	}
}
function toggle_post_del(show) {
	var post_check_all = document.getElementById('post_check_all');
		post_check_all.style.display = show ? 'block' : 'none';
	var post_del = document.getElementById('post_del');
		post_del.style.display = show ? 'block' : 'none';
	for (var i = 0; i < board_list_size; i++){
		var post_check_num = document.getElementById('post_check_' + i);
		if (post_check_num) {
			post_check_num.style.display = show ? 'block' : 'none';
		}
	}
}
function list_del(event) {
	event.stopPropagation();
}
function modi_name(event) {
	event.stopPropagation();
}
function post_check_all() {
	var allChecked = $('.post_check').length === $('.post_check:checked').length;
    $('.post_check').prop('checked', !allChecked);
}
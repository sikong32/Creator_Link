$(document).ready(function() {
    if (like == "true"){
		$(".like_box").toggleClass("liked_box");
		$("#like_none, #like_active").toggle();
	}
    //작동영역
	$("#submitButton").click(function() {
		if (state == "true"){
    		var cm_content = document.getElementById("cm_content").value;
    		$.ajax({
    			type:"post",
    			async:true,
    			url:"comment_save",
    			data:{
    				"cm_content":cm_content,
    				"bct_content_number":bct_content_number,
    				"mb_number":mb_number
    			},
    			success:function(result) {
    				location.reload();
    			},
    			error:function() {
    				alert("등록실패");
    			}
    		});
		}
		else{
			alert("회원만 작성 가능합니다");
		}
	});
	$("[id^=re_submitButton_]").each(function() {
		$(this).click(function() {
    		if (state == "true"){
    			var index = this.id.split('_')[2];
    			var cm_number = $(this).data('cm_number');
	    		var re_content = $("#re_content_" + index).val();
	    		$.ajax({
	    			type:"post",
	    			async:true,
	    			url:"comment_save",
	    			data:{
	    				"cm_content":re_content,
	    				"bct_content_number":bct_content_number,
	    				"cm_inheritance":cm_number,
	    				"cm_indent":"1",
	    				"mb_number":mb_number
	    			},
	    			success:function(result) {
	    				location.reload();
	    			},
	    			error:function() {
	    				alert("등록실패");
	    			}
	    		});
    		}
    		else{
    			alert("회원만 작성 가능합니다");
    		}
			
		});
	});
	$("[id^=comment_del_]").each(function() {
		$(this).click(function() {
			var mb_id = $(this).data('mb_id');
			var number = $(this).data('cm_number');
			if (mb_id == login_id){
				var result = confirm("삭제하시겠습니까?");
				if (result == true){
					$.ajax({
						type:"post",
						async:true,
						url:"comment_delete",
						data:{
							"cm_number":number,
						},
						success:function(result){
							location.reload();
						},
						error:function(){
							alert("삭제실패");
						}
					});
				}
			}
			else{
				alert("권한이 없습니다");
			}
		});
	});
	$("#noties_bt").click(function() {
		if (mb_number == login_number) {
			var value = "false";
			if (noties == 'false'){
				value = "true"
			}
			$.ajax({
				type:"post",
				async:true,
				url:"board_set_noties",
				data:{
					"noties":value,
					"bct_content_number":bct_content_number
				},
				success:function(result) {
					location.reload();
				},
				error:function() {
					alert("변경실패");
				}
			});
		}
		else{
		}
	});
	$(".like_box").click(function() {
		if (state == 'true'){
			$("#like_none, #like_active").toggle();
		    $(".like_box").toggleClass("liked_box");
		    $.ajax({
		    	type : "post",
		    	url : "post_like",
		    	async : true,
		    	data : {
		    		"like":like,
		    		"bct_content_number":bct_content_number
		    	},
		    	success : function (result) {
					location.reload();
				},
				error : function() {
					alert("실패");
				}
		    });
		}
		else {
			alert("로그인후 이용해주십시오");
		}
	});
	
	//기능영역
	document.querySelectorAll('[id^=comment_]').forEach(function(select) {
		select.addEventListener('click', function(event) {
            var index = this.id.split('_')[1]; // 클릭된 요소의 ID에서 인덱스 번호 추출
            var divarea = document.getElementById('re_comment_div_' + index);
            if (divarea !== null) {
                var isVisible = divarea.style.display === 'block';
                toggledivareaVisibility(!isVisible, index); // 대댓글 입력 영역의 표시 상태 토글
            } 
            else {
            }
            event.stopPropagation(); // 클릭 이벤트 전파 중지
        });
    });
	
	document.querySelectorAll('[id^=comment_area_]').forEach(function(element) {
	    element.addEventListener('mouseenter', function(event) {
	        this.querySelector('[id^=comment_del_]').style.display = 'inline'; // 삭제 버튼 표시
	        event.stopPropagation();
	    });

	    element.addEventListener('mouseleave', function(event) {
	        this.querySelector('[id^=comment_del_]').style.display = 'none'; // 삭제 버튼 숨김
	        event.stopPropagation();
	    });
	});
	
    function toggledivareaVisibility(visible, index) {
        var divarea = document.getElementById("re_comment_div_" + index);
		var reCommentDivs = document.querySelectorAll('[id^="re_comment_div_"]');
        
        reCommentDivs.forEach(function(item) {
            item.style.display = "none";
        });
        
        if (visible) {
        	divarea.style.display = "block"; // 버튼을 보이게 함
        } 
        else {
        	divarea.style.display = "none"; // 버튼을 숨김
        }
    }
    
	// textarea 클릭 시 버튼 활성화
    document.getElementById("cm_content").addEventListener("click", function(event) {
        toggleButtonVisibility(true); // 버튼을 보이게 함
        event.stopPropagation(); // 클릭 이벤트 전파 중지
    });
	
    // document 클릭 시 버튼 숨기기
    document.addEventListener("click", function(event) {
        var target = event.target;
        var button = document.getElementById("submitButton");
		
        // textarea 이외의 다른 요소를 클릭했을 때 버튼을 숨김
        if (target.id !== "cm_content" && target !== button) {
            toggleButtonVisibility(false); // 버튼을 숨김
        }
    });

    function toggleButtonVisibility(visible) {
        var button = document.getElementById("submitButton");
        if (visible) {
            button.style.display = "block"; // 버튼을 보이게 함
        } else {
            button.style.display = "none"; // 버튼을 숨김
        }
    }
    
	$("#modify_button").click(function() {
        if (writer_id == login_id){
            window.location="board_modify?bct_content_number=" + bct_content_number + "&mb_number=" + mb_number;
        } else {
            alert("권한이 없습니다");
        }
    });
    
    $("#delete_button").click(function() {
        if (writer_id == login_id){
			var result = confirm("삭제하시겠습니까?");
			if (result == true){
				window.location="board_delete?bct_content_number=" + bct_content_number + "&mb_number=" + mb_number;
			}
			else{
			}
		}
		else{
			alert("권한이 없습니다");
		}
    });
});
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<table border="1" style="margin: auto; width: 1000px">
		<tr>
			<th>${post.bct_title}</th>
		</tr>
		<tr>
			<td>${post.bct_writer}<br>
				${post.bct_write_date} &emsp; 
				${post.bct_view_cnt}</td>
		</tr>
		<tr>
			<td>${post.bct_content}</td>
		</tr>
		<tr>
			<td>댓글</td>
		</tr>
		<tr>
			<th align="left">댓글작성 &emsp;&emsp; ${member.mb_id}</th>
		</tr>
		<tr>
		    <td align="center" style="position: relative;">
		        <textarea id="cm_content" name="cm_content" style="width: 99%; height: 50px;" placeholder="댓글을 입력해주십시오" onclick="toggleButtonVisibility()"></textarea>
		        <button id="submitButton" type="button" onclick="submitComment()" style="position: absolute; right: 10px; bottom: 10px; display: none;">작성</button>
		    </td>
		</tr>
		<tr>
			<td align="right">	<button type="button" onclick="post_modify()">수정</button>
								<button type="button" onclick="post_del()">삭제</button></td>
		</tr>
	</table>
</body>
	<script type="text/javascript">
		var write_id = "${post.bct_writer}";
    	var login_id = "${member.mb_id}";
    	
    	
    	
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

        function submitComment() {
            var cm_content = document.getElementById("cm_content").value;
            var bct_content_number = "${post.bct_content_number}";
            var mb_number = "${member.mb_number}";
            window.location = "comment_save?cm_content="+cm_content+"&bct_content_number="+bct_content_number+"&mb_number="+mb_number;
        }
    	
    	function post_modify() {
    		if (write_id == login_id){
				window.location="board_modify?bct_content_number=${post.bct_content_number}"
			}
			else{
				alert("권한이 없습니다")
			}
		}
		function post_del() {
			if (write_id == login_id){
				var result = confirm("삭제하시겠습니까?");
				if (result == true){
					window.location="board_delete?bct_content_number=${post.bct_content_number}"
				}
				else{
				}
			}
			else{
				alert("권한이 없습니다")
			}
		}
	</script>
</html>
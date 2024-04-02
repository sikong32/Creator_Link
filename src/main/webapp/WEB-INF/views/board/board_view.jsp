<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<table border="1" style="margin: auto; width: 1000px;">
		<tr>
			<th align="left">${post.bct_title}</th>
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
			<c:if test="${comment.size() != 0}">
				<c:forEach items="${comment}" var="c" varStatus="status">
					<c:if test="${c.cm_inheritance == 0}">
						<tr>
							<td>${c.mb_nick_name} &emsp;&emsp;
							<a id="comment_${status.index}" href="#" style="color: black; text-decoration-line: none;">
								${c.cm_content}
							</a>
							<span style="float: right;">
								<button type="button" onclick="comment_delete(${c.cm_number},${c.cm_indent},'${c.mb_id}')">x</button>&emsp;
								${c.cm_write_date}
							</span>
					    	<div id="re_comment_div_${status.index}" style="display: none; width: 95%; background-color: rgb(0,0,0,0.1); border: 1px solid white; float: right; text-align: center;">
					            <textarea id="re_content_${status.index}" name="re_content_${status.index}" style="width: 99%; height: 50px;" placeholder="댓글을 입력해주십시오"></textarea>
					            <span style="float: right;"><button id="re_submitButton_${status.index}" type="button" onclick="re_submitComment(${status.index}, ${c.cm_number})">작성</button></span>
					        </div>
					        <c:forEach items="${comment}" var="rc">
					        	<c:if test="${rc.cm_inheritance == c.cm_number}">
							    	<div style="width: 95%; background-color: rgb(0,0,0,0.1); border: 1px solid white; text-align: left; float: right;">
							    		${rc.mb_nick_name} &emsp;&emsp; ${rc.cm_content} 
							    		<span style="float: right;">
							    			<button type="button" onclick="comment_delete(${rc.cm_number},${rc.cm_indent},'${rc.mb_id}')">x</button>&emsp;
							    			${rc.cm_write_date}
							    		</span>
							    	</div>
						    	</c:if>
					    	</c:forEach></td>
						</tr>
					</c:if>
				</c:forEach>
			</c:if>
		<tr>
			<td><span style="font-weight: bold;">댓글작성</span> &emsp;
			${member.mb_nick_name}</td>
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
	
	<script type="text/javascript">
		var write_id = "${post.bct_writer}";
    	var login_id = "${member.mb_id}";
    	
    	// comment 클릭 시 버튼 활성화
    	<c:forEach items="${comment}" var="c" varStatus="status">
    		<c:if test="${c.cm_inheritance == 0}">
		        document.getElementById("comment_${status.index}").addEventListener("click", function(event) {
		        	var divarea = document.getElementById("re_comment_div_${status.index}");
		        	var isVisible = divarea.style.display === "block";
		        	
		        	toggledivareaVisibility(!isVisible, "${status.index}"); // 버튼을 보이게 함
		        	event.stopPropagation(); // 클릭 이벤트 전파 중지
		        });
	        </c:if>
        </c:forEach>
        
        function toggledivareaVisibility(visible, index) {
            var divarea = document.getElementById("re_comment_div_" + index);
  			var reCommentDivs = document.querySelectorAll('[id^="re_comment_div_"]');
            
            reCommentDivs.forEach(function(item) {
                item.style.display = "none";
            });
            
            if (visible) {
            	divarea.style.display = "block"; // 버튼을 보이게 함
            } else {
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

        function submitComment() {
            var cm_content = document.getElementById("cm_content").value;
            var bct_content_number = "${post.bct_content_number}";
            if("${member.mb_id}" != ""){
            	window.location = "comment_save?cm_content="+cm_content+"&bct_content_number="+bct_content_number+"&cm_indent=0";
            }
            else{
            	alert("회원만 작성 가능합니다")
            }
        }
    	
        function re_submitComment(index, number) {
            var cm_content = document.getElementById("re_content_" + index).value;
            var bct_content_number = "${post.bct_content_number}";
            if("${member.mb_id}" != ""){
            	window.location = "comment_save?cm_content="+cm_content+"&bct_content_number="+bct_content_number+"&cm_inheritance="+number+"&cm_indent=1";
            }
            else{
            	alert("회원만 작성 가능합니다")
            }
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
		function comment_delete(number, indent, mb_id) {
			if (mb_id == login_id){
				var result = confirm("삭제하시겠습니까?");
				if (result == true){
					window.location="comment_delete?cm_number="+number+"&cm_indent="+indent;
				}
				else{
				}
			}
			else{
				alert("권한이 없습니다")
			}
		}
	</script>
</body>
</html>
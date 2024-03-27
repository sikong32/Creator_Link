<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<table border="1">
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
			<td align="right">	<button type="button" onclick="post_modify()">수정</button>
								<button type="button" onclick="post_del()">삭제</button></td>
		</tr>
	</table>
</body>
	<script type="text/javascript">
		var write_id = "${post.bct_writer}";
    	var login_id = "${member.mb_id}";
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
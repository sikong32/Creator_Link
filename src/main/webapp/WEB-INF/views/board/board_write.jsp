<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
	<style type="text/css">
		.inputbox{
			display: flex;
			justify-content: center;
			width: auto;
		}
		.inputbox .ck-editor__editable {
		    width: auto; /* CKEditor 너비, 필요에 따라 조정 */
		    margin: auto; /* 중앙 정렬 */
		}
	</style>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<form id="form_input" action="board_save" method="post">
		<div id="container">
			<table border="1">
				<tr>
					<td><select name="attribute">
							<c:forEach items="${attribute_list}" var="atli">
								<option value="${atli.bat_number}">${atli.bat_cls}</option>
							</c:forEach>
						</select>
						<input type="text" name="title" placeholder="제목"></td>
				</tr>
				<tr>
					<td><div class="inputbox"><textarea name="content" id="editor"></textarea></div>
				</tr>
				<tr>
					<td align="right"><input type="button" value="글 작성" onclick="val_check()"></td>
				</tr>
			</table>
		</div>
	</form>
        
	<script src="https://cdn.ckeditor.com/ckeditor5/34.2.0/super-build/ckeditor.js"></script>
	<script type="text/javascript" src="resources/js/editor_check.js"></script>
	<script type="text/javascript" src="resources/js/input_editor.js"></script>
</body>
</html>
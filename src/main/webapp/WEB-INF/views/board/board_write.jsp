<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
	<link href="${pageContext.request.contextPath}/resources/css/board/board.css" rel="stylesheet" type="text/css">
	<style type="text/css">
		/* .inputbox{
			display: flex;
			justify-content: center;
			width: auto;
		}
		.inputbox .ck-editor__editable {
		    width: auto; /* CKEditor 너비, 필요에 따라 조정 */
		    margin: auto; /* 중앙 정렬 */
		} */
	</style>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div class="background">
		<div class="container">
			<div class="sidebar">
				<aside class="category_list">
					<div class="category_title">
						<span>CreatorLink</span>
					</div>
					<div onclick="location.href='board_main'" class="category">전체글</div>
					<c:forEach items="${attribute_list}" var="atli">
					<div class="category" onclick="location.href='board_main?bat_number=${atli.bat_number}'">${atli.bat_cls}</div>
					</c:forEach>
				</aside>
				<div class="store" onclick="location.href='store_main'">STORE</div>
			</div>
			<div class="board">
				<form id="form_input" action="board_save" method="post">
					<div class="post_write">
						<div style="display: flex; align-items: center; justify-content: space-between;">
							<div style="width: 19%; display: flex; align-items: center;">
							<select name="attribute" style="width: 100%; height: 21px;">
								<c:forEach items="${attribute_list}" var="atli">
									<option value="${atli.bat_number}">${atli.bat_cls}</option>
								</c:forEach>
							</select>
							</div>
							<div style="width: 80%; display: flex; align-items: center;"><input type="text" name="title" placeholder="제목" style="width: 100%;"></div>
						</div>
						<div class="inputbox"><textarea name="content" id="editor"></textarea></div>
						<div style="float: right;"><input type="button" value="작성" onclick="val_check()"></div>
					</div>
				</form>
			</div>
		</div>
	</div>
	<script src="https://cdn.ckeditor.com/ckeditor5/34.2.0/super-build/ckeditor.js"></script>
	<script type="text/javascript" src="resources/js/editor_check.js"></script>
	<script type="text/javascript" src="resources/js/input_editor.js"></script>
</body>
</html>
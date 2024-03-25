<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<!-- CKEditor 스크립트 포함 -->
<script
	src="https://cdn.ckeditor.com/ckeditor5/41.2.1/classic/ckeditor.js"></script>
<script
	src="https://cdn.ckeditor.com/ckeditor5/41.2.1/classic/translations/ko.js"></script>
<body>


	<h1>스마트 에디터</h1>

	<!-- CKEditor 에디터 표시 -->
	<form action="editor" method="post">
		<textarea id="editor" name="editor"></textarea>
		<input type="submit" value="전송">
	</form>
	<script>
	// CKEditor 초기화
    ClassicEditor
       .create( document.querySelector( '#editor' ) )
       .then( editor => {
               console.log( editor );
       } )
       .catch( error => {
               console.error( error );
       } );
</script>
</body>
</html>
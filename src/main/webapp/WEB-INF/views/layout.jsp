<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="t"%>
<!DOCTYPE html>
<html>
<head>
	<script type="text/javascript">
		window.onload = function() {
			 var container_width = document.getElementById('container').offsetWidth;
		        var container_border_width = document.getElementById('container').clientWidth - document.getElementById('container').offsetWidth;
		        var container_actual_width = container_width + container_border_width;

		        document.getElementById('top').style.width = container_actual_width + 'px';
		        document.getElementById('body').style.width = container_actual_width + 'px';
		        document.getElementById('footer').style.width = container_actual_width + 'px';
		}
	</script>
	<style type="text/css">
		#top{
			position: fixed;
			top: 0px;
			text-align: center;
			line-height: 150px;
			height: 150px;
			margin: auto;
			background-color: rgb(0,0,0,0.2);
		}
		#body{
			margin-top: 160px;
			margin-bottom: 30px;
		}
		#footer{
			position: fixed;
			bottom: 0px;
			text-align: center;
			line-height: 20px;
			margin: auto;
			border: solid;
			width: 100%;
		}
	</style>
<meta charset="UTF-8">
<title><t:insertAttribute name="title" /></title>
</head>
<body>
	<div id="container">
		<div id="top"><t:insertAttribute name="top" /></div>
		<div id="body"><t:insertAttribute name="body" /></div>
		<div id="footer"><t:insertAttribute name="footer" /></div>
	</div>
</body>
</html>
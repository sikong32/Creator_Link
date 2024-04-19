<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<!-- JS -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js" defer></script>
<script src="${pageContext.request.contextPath}/resources/js/gifthub_creator_select.js" defer></script>
<!-- css -->
<link href="${pageContext.request.contextPath}/resources/css/gifthub/creator_select.css" rel="stylesheet" type="text/css">
<meta charset="UTF-8">
<title>크리에이터 목록</title>
</head>
<body>
	<div class="select_container">
		<div class="search">
			<input class="search_box" type="text" id="search_keyword" placeholder="검색 할 닉네임 입력">
			<button onclick="searchCreator()">검색</button>
		</div>
		<ul id="creator_list"></ul>
		<div class="basic_creator_list" id="basic_creator_list">
		<c:forEach items="${list}" var="creator" varStatus="status">
			<c:if test="${status.index < 5}">
				<ul class="basic_creator">
					<li><img src="resources/member/basic_photo/${creator.mb_photo}"></li>
	            	<li>${creator.mb_nick_name}</li>
	            	<li><button class="select_creator" onclick="selectCreator()"
	            	data-nick="${creator.mb_nick_name}"  data-photo="${creator.mb_photo}" data-post="${creator.mb_addr_post}"
            		data-road="${creator.mb_addr_road}" data-local="${creator.mb_addr_local}" data-detail="${creator.mb_addr_detail}">선택</button></li>
	        	</ul>
	        </c:if>
		</c:forEach>
		</div>
	</div>
</body>
</html>
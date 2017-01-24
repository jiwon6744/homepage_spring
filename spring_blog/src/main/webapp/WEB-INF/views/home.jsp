<%@ page contentType="text/html; charset=utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:choose>
	<c:when test="${empty sessionScope.id }">
		<c:set var="str">로그인 해주세요.</c:set>
	</c:when>
	<c:otherwise>
		<c:set var="str">안녕하세요 ${sessionScope.id } 님!</c:set>
	</c:otherwise>
</c:choose>
<c:set var="title">JIWON`S HOMEPAGE</c:set>
<c:if test="${not empty sessionScope.id && sessionScope.grade=='A'}">
	<c:set var="title">관리자 페이지</c:set>
</c:if>
<html>
<head>
<title>Home</title>
</head>
<link rel="shortcut icon" href="${pageContext.request.contextPath }/assets/ico/favicon.png">
<link rel="stylesheet" href="${pageContext.request.contextPath }/assets/css/font-awesome.min.css">
<link href="${pageContext.request.contextPath }/assets/css/bootstrap.css" rel="stylesheet">
<link href="${pageContext.request.contextPath }/assets/css/main.css" rel="stylesheet">
<link href='http://fonts.googleapis.com/css?family=Lato:300,400,700,300italic,400italic' rel='stylesheet' type='text/css'>
<link href='http://fonts.googleapis.com/css?family=Raleway:400,300,700' rel='stylesheet' type='text/css'>
<body>
	<div class="content" id="w">

	
		<h3>${str }</h3>
		<h3>${title }</h3>
		<c:choose>
			<c:when test="${empty sessionScope.id }">
				<input type="button" value="로그인"
					onclick="location.href='${pageContext.request.contextPath}/member/login'"
					class="button">
			</c:when>
			<c:otherwise>
				<input type="button" value="로그아웃"
					onclick="location.href='${pageContext.request.contextPath}/member/logout'"
					class="button">
			</c:otherwise>
		</c:choose>
	</div>
	<div class="bottom">
			<input type="button" class="button" value="팀" onclick="location.href='team/list'"> 
			<input type="button" class="button" value="메모" onclick="location.href='memo/list'">
			<input type="button" class="button" value="게시판" onclick="location.href='bbs/list'">
			<input type="button" class="button" value="주소" onclick="location.href='address/list'">
			<input type="button" class="button" value="회원목록(관리자전용)" onclick="location.href='admin/list'">
			<input type="button" class="button" value="회원정보" onclick="location.href='member/read'">
			<input type="button" class="button" value="이미지" onclick="location.href='imgbbs/list'">
	</div>
</body>
</html>

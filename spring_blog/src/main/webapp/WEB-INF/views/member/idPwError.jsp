<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
</head>
<link rel="shortcut icon" href="${pageContext.request.contextPath }/assets/ico/favicon.png">
<link rel="stylesheet" href="${pageContext.request.contextPath }/assets/css/font-awesome.min.css">
<link href="${pageContext.request.contextPath }/assets/css/bootstrap.css" rel="stylesheet">
<link href="${pageContext.request.contextPath }/assets/css/main.css" rel="stylesheet">
<link href='http://fonts.googleapis.com/css?family=Lato:300,400,700,300italic,400italic' rel='stylesheet' type='text/css'>
<link href='http://fonts.googleapis.com/css?family=Raleway:400,300,700' rel='stylesheet' type='text/css'>
<!-- *********************************************** -->
<body>
<div id="w">
	<div class="title"><h3>로그인처리</h3></div>
	<div class="content">
	<c:choose>
		<c:when test="${flag }">
			로그인이 되었습니다.
		</c:when>
		<c:otherwise>
			"아이디/비밀번호를 잘못 입력하셨거나"<br>"회원이 아닙니다. 회원가입을 하세요."<br>
		</c:otherwise>
	</c:choose>
	</div>
	<div class='bottom'>
		<input type='button' value='홈' class="button" onclick="history.go(-2);"> 
		<input type='button' value='다시시도' class="button" onclick="history.back()">
	</div>
</div>
</body>
</html>

<%@ page contentType="text/html; charset=UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
<link href="${pageContext.request.contextPath}/assets/css/main.css"
	rel="stylesheet">
<link href="${pageContext.request.contextPath}/assets/css/bootstrap.css"
	rel="stylesheet">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/assets/css/font-awesome.min.css">
</head>
<body>
	<div id="w">
		<div class="content">

			<h3>
				비밀번호 오류입니다.<br> 비밀번호를 다시 입력하세요.
			</h3>
		</div>
		<div class="bottom">
			<input type='button' value='다시시도' class="button"
				onclick="history.back()">
		</div>
	</div>
</body>
</html>


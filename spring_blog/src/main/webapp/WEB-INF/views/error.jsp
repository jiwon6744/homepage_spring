<%@ page contentType="text/html; charset=UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
<link href="${pageContext.request.contextPath}/assets/css/main.css" rel="stylesheet">
<link href="${pageContext.request.contextPath}/assets/css/bootstrap.css" rel="stylesheet">
<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/font-awesome.min.css">
</head>
<body>
	<div id="w">
		<div class="content">
		<h3>데이터베이스 처리중 오류가 발생헀습니다<br>
		잠시후에 다시 한번 시도하세요.</h3>
		</div>
		<div class="bottom">
			<input type='button' value='다시시도' class="button" onclick="history.back()">
		</div>
	</div>
</body>
</html>


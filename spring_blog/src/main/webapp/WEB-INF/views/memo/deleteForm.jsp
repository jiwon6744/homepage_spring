<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
<script type="text/javascript">
function mlist() {
	var url = "list";
	url += "?col=${param.col}";
	url += "&word=${param.word}";
	url += "&nowPage=${param.nowPage}";
	location.href = url;
	}
function mdelete() {
	var url = "delete";
	url += "?col=${param.col}";
	url += "&word=${param.word}";
	url += "&nowPage=${param.nowPage}";
	location.href = url;
	}
</script>
</head>
<body>
	<div id="w">
		<div class="title"><h3>메모 삭제</h3></div>
		<div class="content">
			정말로 벝ㄴ
		</div>
		<div class="bottom">
			<input type="button" class="button" value="확인" onclick="mdelete()">
			<input type="button" class="button" value="목록" onclick="mlist()">
		</div>
	</div>
</body>
</html>

<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
<script type="text/javascript">
function tcreateForm() {
	var url = "create.do";
	url += "?col=${param.col}";
	url += "&word=${param.word}";
		location.href = url;
	}
function tlist() {
	var url = "list.do";
		location.href = url;
	}
</script>
</head>
<body>
<div id="w">
	<div class="title">팀 등록 결과</div>
	<div class="content">
		<c:choose>
			<c:when test="${flag }">
				팀 정보 등록 성공!!
			</c:when>
			<c:otherwise>
				팀 정보 등록 실패!!
			</c:otherwise>
		</c:choose>
	</div>
	<div class="bottom">
		<input type="button" class="button" value="계속 등록" onclick="tcreateForm()"> 
		<input type="button" class="button" value="목록" onclick="tlist()">
	</div>
</div>
</body>
</html>

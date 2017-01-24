<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
<script type="text/javascript">
function tlist() {
	var url = "list.do";
	url += "?col=${param.col}";
	url += "&word=${param.word}";
	url += "&nowPage=${param.nowPage}";
		location.href = url;
	}
</script>
</head>
<body>
<div id="w">
	<div class="title">팀 삭제 결과</div>
	<div class="content">
		<c:choose>
			<c:when test="${flag }">
				팀 정보 삭제 성공
			</c:when>
			<c:otherwise>
				팀 정보 삭세 실패
			</c:otherwise>
		</c:choose>
	</div>
	<div class="bottom">
		<input type="button" class="button" value="목록" onclick="tlist()">
	</div>
</div>
</body>
</html>

<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
<script type="text/javascript">

	function tread() {
		var url = "read.do";
		url += "?teamno=${teamno}";
		url += "&nowPage=${nowPage}";
		url += "&col=${col}";
		url += "&word=${word}";
		location.href = url;
	}
</script>
</head>
<body>
	<div id="w">
		<div class="title"><h3>사진변경</h3></div>
		<div class="content">
			<c:choose>
				<c:when test="${flag }">
					사진변경성공
				</c:when>
				<c:otherwise>
					사진변경실패
				</c:otherwise>
			</c:choose>
		</div>
		<div class='bottom'>
			<input type='button' value='조회' class="button" onclick="tread()"> 
			<input type='button' value='다시시도' class="button" onclick="history.back()">
		</div>
	</div>
</body>
<!-- *********************************************** -->
</html>

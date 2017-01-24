<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
<script type="text/javascript">
	function use() {
		opener.frm.id.value='${id}';
		window.close();
	}
</script>
<link href="${pageContext.request.contextPath }/css/style.css" rel="Stylesheet" type="text/css">
</head>
<body>
<div id="w">
	<div class="title">아이디 중복 확인</div>
	<div class="content">
		입력된 ID:	${id}<br><br>
		<c:choose>
			<c:when test="${flag }">
				중복되어서 사용할 수 없습니다.
			</c:when>
			<c:otherwise>
				사용가능합니다.
				<input type='button' value='사용' class='button_mini' onclick='use()'>
			</c:otherwise>
		</c:choose>
	</div>
	<div class='bottom'>
		<input type='button' value='다시시도' class="button" onclick="location.href='id_form'"/> 
		<input type='button' value='닫기' class="button" onclick="window.close()"/>
	</div>
</div>
</body>
</html>

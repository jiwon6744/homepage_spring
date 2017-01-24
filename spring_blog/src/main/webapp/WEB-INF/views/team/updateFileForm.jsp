<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
<script type="text/javascript">
	function incheck(f) {
		if (f.filename.value == "") {
			alert("파일을 선택하세요");
			f.filename.focus();
			return false;
		}
	}
</script>
</head>
<body>
<div id="w">
	<div class="title"><h3>사진수정</h3></div>

	<form name='frm' method='POST' action='./updateFileProc.do' enctype="multipart/form-data" onsubmit="return incheck(this)">
		<input type="hidden" name="teamno" value="${param.teamno }"> 
		<input type="hidden" name="col" value="${param.col }"> 
		<input type="hidden" name="word" value="${param.word }"> 
		<input type="hidden" name="nowPage" value="${param.nowPage }"> 
		<input type="hidden" name="oldfile" value="${oldfile }">
		<table>
			<tr>
				<th>원본파일</th>
				<td>
					<img src="${pageContext.request.contextPath }/views/team/storage/${param.oldfile}"><br> 원본파일명:${param.oldfile }</td>
			</tr>
			<tr>
				<th>변경파일</th>
				<td>
					<input type="file" name="filename">
				</td>
			</tr>
		</table>

		<div class='bottom'>
			<input type='submit' value='변경' class="button"> 
			<input type='button' value='취소' class="button" onclick="history.back()">
		</div>
	</form>
</div>
</body>
</html>

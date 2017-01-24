<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
<script type="text/javascript">
	function incheck(f) {
		if (f.passwd.value == "") {
			alert("패스워드를 입력하세요");
			f.passwd.focus();
			return false;
		}
	}
</script>
</head>
<link rel="shortcut icon"href="${pageContext.request.contextPath }/assets/ico/favicon.png">
<link rel="stylesheet"href="${pageContext.request.contextPath }/assets/css/font-awesome.min.css">
<link href="${pageContext.request.contextPath }/assets/css/bootstrap.css"rel="stylesheet">
<link href="${pageContext.request.contextPath }/assets/css/main.css"rel="stylesheet">
<link href='http://fonts.googleapis.com/css?family=Lato:300,400,700,300italic,400italic'rel='stylesheet' type='text/css'>
<link href='http://fonts.googleapis.com/css?family=Raleway:400,300,700' rel='stylesheet' type='text/css'>
<body>
	<div id="w">
		<div class="title">
			<h3>게시판 삭제</h3>
		</div>

		<div class="content">
			<c:choose>
				<c:when test="${flag }">
				답변이 있는 글이므로 삭제할 수 없습니다.<br>
					<input type='button' value='다시 시도' onclick="history.go(-2)" class="button">
				</c:when>
				<c:otherwise>
					<form name='frm' method='POST' action='./delete'
						onsubmit="return incheck(this)">
						<input type="hidden" name="bbsno" value="${param.bbsno }" /> 삭제하면 복구할 수 없습니다.<br />
						<input name="bbsno" value="${param.bbsno }"	type="hidden"> 
						<input name="col" value="${param.col }" type="hidden"> 
						<input name="word" value="${param.word }" type="hidden"> 
						<input name="nowPage" value="${param.nowPage }" type="hidden">
						<br /> <input name="oldfile" value="${param.oldfile }"type="hidden">
						<br />
						<table>
							<tr>
								<th class="table-bordered th">패스워드</th>
								<td class="table-bordered td"><input type="password" name="passwd" /></td>
							</tr>
						</table>
						<br>
						<br>
						<div class='bottom'>
							<input type='submit' value='확인' class="button"> 
							<input type='button' value='취소' onclick="history.back()" class="button">
						</div>
					</form>
				</c:otherwise>
			</c:choose>
		</div>
	</div>
</body>
</html>

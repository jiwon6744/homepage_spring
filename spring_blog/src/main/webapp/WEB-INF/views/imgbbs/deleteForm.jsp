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
			alert("패스워드를 입력하세요.");
			f.passwd.focus();
			return false;
		}
	}
</script>
</head>
<body>
	<div id="w">
		<DIV class="title">
			<h3>삭제</h3>
		</DIV>
		<div class="content">
			<c:choose>
				<c:when test="${flag }">
					답변이 있는 글이므로 삭제를 할 수 없습니다.<br>
					<input type='button' value='목록으로' class='button'
						onclick='history.go(-2)'>
				</c:when>
				<c:otherwise>
					<div class="content">
						<FORM name='frm' method='POST' action='./delete'
							onsubmit="return incheck(this)">
							<input type="hidden" name="no" value="${param.no}"> 
							<input name="col" value="${param.col}" type="hidden"> 
							<input name="word" value="${param.word}" type="hidden"> 
							<input name="nowPage" value="${param.nowPage }" type="hidden">
							<input type='hidden' name='oldfile' value='${param.oldfile}'>
							<TABLE>
								<TR>
									<TH>패스워드</TH>
									<TD><input type="password" name="passwd"></TD>
								</TR>
							</TABLE>
							<DIV class='bottom'>
								<input type='submit' value='삭제' class="button"> <input
									type='button' value='뒤로가기' class="button"
									onclick="history.back()">
							</DIV>
						</FORM>
					</div>
				</c:otherwise>
			</c:choose>
		</div>
	</div>
</body>
</html>

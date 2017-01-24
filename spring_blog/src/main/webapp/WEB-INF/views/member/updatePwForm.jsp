<%@ page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
<link rel="shortcut icon" href="${pageContext.request.contextPath }/assets/ico/favicon.png">
<link rel="stylesheet" href="${pageContext.request.contextPath }/assets/css/font-awesome.min.css">
<link href="${pageContext.request.contextPath }/assets/css/bootstrap.css" rel="stylesheet">
<link href="${pageContext.request.contextPath }/assets/css/main.css" rel="stylesheet">
<link href='http://fonts.googleapis.com/css?family=Lato:300,400,700,300italic,400italic' rel='stylesheet' type='text/css'>
<link href='http://fonts.googleapis.com/css?family=Raleway:400,300,700' rel='stylesheet' type='text/css'>
<script type="text/javascript">
	function inCheck(f) {
		if(f.passwd.value==""){
			alert("패스워드를 입력하세요.");
			f.passwd.focus();
			return false;
		}
		if(f.repasswd.value==""){
			alert("패스워드 확인을 입력하세요.");
			f.repasswd.focus();
			return false;
		}
		if(f.passwd.value != f.repasswd.value){
			alert("비밀번호가 일치하지 않습니다. 다시 입력하세요.");
			f.passwd.focus();
			return false;
		}
	}
</script>
</head>
<body>
<div id="w">
	<div class="title"><h3>패스워드 변경</h3></div>

	<form name='frm' method='POST' action='./updatePw' onsubmit="return inCheck(this)">
		<input type="hidden" name="id" value="${param.id }">
		<table>
			<tr>
				<th>패스워드</th>
				<td>
					<input type="password" name="passwd">
				</td>
			</tr>
			<tr>
				<th>패스워드 확인</th>
				<td>
					<input type="password" name="repasswd">
				</td>
			</tr>
		</table>

		<div class='bottom'>
			<input type='submit' value='패스워드 수정' class="button"> 
			<input type='button' value='취소' class="button" onclick="history.back()">
		</div>
	</form>
</div>

</body>
<!-- *********************************************** -->
</html>

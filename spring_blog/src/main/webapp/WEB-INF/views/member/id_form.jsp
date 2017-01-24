<%@ page contentType="text/html; charset=UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
<link href="${pageContext.request.contextPath }/css/style.css" rel="Stylesheet" type="text/css">
</head>
<body>

	<div class="title">아이디 중복 확인</div>
	<div class="content">
		<form name='frm' method='POST' action='./id_proc'>
			ID를 입력해주세요.<br> <br>
			<table>
				<tr>
					<th>아이디</th>
					<td>
						<input type="text" name="id" size="20" />
					</td>
				</tr>
			</table>

			<div class='bottom'>
				<input type='submit' value='중복확인' class="button"> 
				<input type='button' value='취소' class="button" onclick="window.close()">
			</div>
		</form>
	</div>
</body>
</html>

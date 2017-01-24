<%@ page contentType="text/html; charset=UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
<link rel="shortcut icon"href="${pageContext.request.contextPath }/assets/ico/favicon.png">
<link rel="stylesheet"href="${pageContext.request.contextPath }/assets/css/font-awesome.min.css">
<link href="${pageContext.request.contextPath }/assets/css/bootstrap.css"rel="stylesheet">
<link href="${pageContext.request.contextPath }/assets/css/main.css"rel="stylesheet">
<link href='http://fonts.googleapis.com/css?family=Lato:300,400,700,300italic,400italic'rel='stylesheet' type='text/css'>
<link href='http://fonts.googleapis.com/css?family=Raleway:400,300,700' rel='stylesheet' type='text/css'>
<script type="text/javascript">
	function input(frm) {
		if (frm.wname.value == "" && frm.title.value == ""
				&& frm.content.value == "" && frm.passwd.value == "") {
			alert("성명, 제목, 내용, 비밀번호를 입력해주세요.");
			frm.wname.focus();
			return false;
		} else if (frm.wname.value == "") {
			alert("이름을 입력해주세요.");
			frm.wname.focus();
			return false;
		} else if (frm.title.value == "") {
			alert("제목을 입력해주세요.");
			frm.title.focus();
			return false;
		} else if (frm.content.value == "") {
			alert("내용을 입력해주세요.");
			frm.content.focus();
			return false;
		} else if (frm.passwd.value == "") {
			alert("비밀번호를 입력해주세요.");
			frm.passwd.focus();
			return false;
		}
	}
</script>
</head>
<!-- *********************************************** -->
<body>
	<!-- *********************************************** -->
<div id="w">
	<div class="title"><h3>게시판 등록</h3></div>

	<form name='frm' 
		  method='POST' 
		  action='create' 
		  enctype="multipart/form-data" 
		  onsubmit="return input(this)">
		<table class="table_width_40">
			<tr>
				<th class="table-bordered th">성명</th>
				<td class="table-bordered td">
					<input type="text" name="wname">
				</td>
			</tr>
			<tr>
				<th class="table-bordered th">제목</th>
				<td class="table-bordered td">
					<input type="text" name="title">
				</td>
			</tr>
			<tr>
				<th class="table-bordered th">내용</th>
				<td class="table-bordered td">
					<textarea rows="10" cols="45" name="content"></textarea>
				</td>
			</tr>
			<tr>
				<th class="table-bordered th">비밀번호</th>
				<td class="table-bordered td">
					<input type="password" name="passwd">
				</td>
			</tr>
			<tr>
				<th class="table-bordered th">파일명</th>
				<td class="table-bordered td">
					<input type="file" name="fileMF">
				</td>
			</tr>
		</table>
		<div class='bottom'>
			<input type='submit' value='등록' class="button"> 
			<input type='button' value='취소' class="button" onclick="location.href='./list'">
		</div>
	</form>
</div>
</body>
</html>

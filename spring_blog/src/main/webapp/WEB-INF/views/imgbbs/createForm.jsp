<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
<link rel="stylesheet" href="${pageContext.request.contextPath }/assets/css/font-awesome.min.css">
<link href="${pageContext.request.contextPath }/assets/css/bootstrap.css" rel="stylesheet">
<link href="${pageContext.request.contextPath }/assets/css/main.css" rel="stylesheet">
<link href='http://fonts.googleapis.com/css?family=Lato:300,400,700,300italic,400italic' rel='stylesheet' type='text/css'>
<link href='http://fonts.googleapis.com/css?family=Raleway:400,300,700' rel='stylesheet' type='text/css'>
<script type="text/javascript" src="${pageContext.request.contextPath}/ckeditor/ckeditor.js"></script>
<script type="text/JavaScript">
	window.onload=function(){
		CKEDITOR.replace('content');  // <TEXTAREA>태그 id 값
	};
</script>
<script type="text/javascript">
	function incheck(f) {
		if (f.name.value == "") {
			alert("이름을 입력하세요");
			f.name.focus();
			return false;
		}
		if (f.title.value == "") {
			alert("제목을 입력하세요");
			f.title.focus();
			return false;
		}
		if (CKEDITOR.instances['content'].getData() == '') {
		      window.alert('내용을 입력해 주세요.');
		      CKEDITOR.instances['content'].focus();
		      return false;
		}
		if (f.passwd.value == "") {
			alert("비밀번호을 입력하세요");
			f.passwd.focus();
			return false;
		}
		if (f.filename.value == "") {
			alert("이미지를 저장하세요");
			f.filename.focus();
			return false;
		}
	}
</script>
</head>
<body>
	<div id="w">
		<DIV class="title"><h3>사진 게시판 등록</h3></DIV>

		<FORM name='frm' method='POST' action='./create'
			onsubmit="return incheck(this)" enctype="multipart/form-data">
			<TABLE>
				<TR>
					<TH>이름</TH>
					<TD><input type="text" name="name" size="40"></TD>
				</TR>
				<TR>
					<TH>제목</TH>
					<TD><input type="text" name="title" size="40"></TD>
				</TR>
				<TR>
					<TH>이미지등록</TH>
					<TD><input type="file" name="fileMF" size="40"></TD>
				</TR>
				<TR>
					<TH>내용</TH>
					<TD><textarea rows="10" cols="40" name="content"></textarea></TD>
				</TR>
				<TR>
					<TH>비밀번호</TH>
					<TD><input type="password" name="passwd" size="40"></TD>
				</TR>

			</TABLE>

			<DIV class='bottom'>
				<input type='submit' value='등록' class="button"> <input
					type='button' value='취소' class="button" onclick="history.back()">
			</DIV>
		</FORM>
	</div>

</body>
</html>

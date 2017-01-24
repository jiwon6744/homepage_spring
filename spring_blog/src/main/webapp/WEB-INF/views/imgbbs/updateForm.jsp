<%@ page contentType="text/html; charset=UTF-8"%>

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
<script type="text/javascript">
	function incheck(f) { //f는 그냥 변수 그냥 다른걸로 써도됨
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
		if (f.content.value == "") {
			alert("내용을 입력하세요");
			f.content.focus();
			return false;
		}
		if (f.passwd.value == "") {
			alert("패스워드를 입력하세요");
			f.passwd.focus();
			return false;
		}
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
		<DIV class="title">
			<h3>수정</h3>
		</DIV>
		<FORM name='frm' method='POST' action='update'
			enctype="multipart/form-data" onsubmit="return incheck(this)">

			<input name="no" value="${param.no }" type="hidden"> 
			<input name="col" value="${param.col }" type="hidden">
			<input name="word" value="${param.word }" type="hidden"> 
			<input name="nowPage" value="${param.nowPage }" type="hidden">
			<input name="oldfile" value="${dto.filename }" type="hidden">
			<TABLE style="width: 45%;">
				<TR>
					<TD colspan="2" class="table-bordered td text-align-c"><img
						style="width: 300px; height: 200px;"
						src="${pageContext.request.contextPath }/imgbbs/storage/${dto.filename}">
					</TD>
				</TR>
				<TR>
					<TH class="table-bordered th">성명</TH>
					<TD class="table-bordered td"><input type="text" name="name"
						size="40" value="${dto.name }"></TD>
				</TR>
				<TR>
					<TH class="table-bordered th">제목</TH>
					<TD class="table-bordered td"><input type="text" name="title"
						size="40" value="${dto.title }"></TD>
				</TR>
				<TR>
					<TH class="table-bordered th">사진파일</TH>
					<TD class="table-bordered td"><input type="file"
						name="fileMF" size="40">${dto.filename }</TD>
				</TR>
				<TR>
					<TH class="table-bordered th">내용</TH>
					<TD><textarea rows="10" cols="40" name="content">${dto.content }</textarea>
					</TD>
				</TR>
				<TR>
					<TH class="table-bordered th">비밀번호</TH>
					<TD class="table-bordered td"><input type="password"
						name="passwd"></TD>
				</TR>
			</TABLE>

			<DIV class='bottom'>
				<input type='submit' value='수정' class="button"> <input
					type='button' value='취소' class="button" onclick="history.back()">
			</DIV>
		</FORM>
	</div>
</body>
</html>

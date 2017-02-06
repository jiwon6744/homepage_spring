<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

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
<script type="text/javascript" src="${pageContext.request.contextPath}/ckeditor/ckeditor.js"></script>
<script type="text/JavaScript">
	window.onload=function(){
		CKEDITOR.replace('content');
	};
</script>
<script type="text/javascript">
	function incheck(f) {
		if (f.wname.value == "") {
			alert("이름을 입력하세요");
			f.wname.focus();
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
			alert("패스워드를 입력하세요");
			f.passwd.focus();
			return false;
		}
	}
</script>
</head>
<body>
	<div id="w">
		<div class="title"><h3>게시판 수정</h3></div>

		<form name='frm' 
			  method='POST' 
			  action='update'
			  enctype="multipart/form-data" 
			  onsubmit="return incheck(this)">
			  
			<input name="bbsno" value="${param.bbsno }" type="hidden"> 
			<input name="col" value="${param.col }" type="hidden">
			<input name="word" value="${param.word }" type="hidden"> 
			<input name="nowPage" value="${param.nowPage }" type="hidden">
			<input name="oldfile" value="${dto.filename }" type="hidden">
			
			<table>
				<tr>
					<th class="table-bordered th">성명</th>
					<td class="table-bordered td"><input type="text" name="wname"
						value="${dto.wname }"></td>
				</tr>
				<tr>
					<th class="table-bordered th">제목</th>
					<td class="table-bordered td"><input type="text" name="title"
						value="${dto.title }"></td>
				</tr>
				<tr>
					<th class="table-bordered th">내용</th>
					<td class="table-bordered td"><textarea rows="10" cols="45" name="content">${dto.content }</textarea>
						<!-- textarea 를 사용할때는 value값을 넣을 수 없다. --></td>
				</tr>
				<tr>
					<th class="table-bordered th">비밀번호</th>
					<td class="table-bordered td"><input type="password" name="passwd"></td>
				</tr>
				<tr>
					<th class="table-bordered th">파일</th>
					<td class="table-bordered td"><input type="file" name="fileMF">(${dto.filename})
					</td>
				</tr>
			</table>
			<div class='bottom'>
				<input type='submit' value='수정' class="button"> 
				<input type='button' value='취소' class="button" onclick="history.back()">
			</div>
		</form>
	</div>
</body>
</html>

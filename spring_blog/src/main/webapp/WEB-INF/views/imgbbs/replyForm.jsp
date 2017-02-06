<%@ page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
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
		if (f.fileMF.value == "") {
			alert("이미지를 저장하세요");
			f.fileMF.focus();
			return false;
		}
	}
</script>
</head>
<!-- *********************************************** -->
<body>
	<div id="w">
		<DIV class="title">
			<h3>답변</h3>
		</DIV>

		<FORM name='frm' method='POST' action='./reply'
			onsubmit="return incheck(this)" enctype="multipart/form-data">
			<!-- 답변을 등록하기 위해서 -->
			<input type='hidden' name='grpno' value='${dto.grpno }'> 
			<input type='hidden' name='indent' value='${dto.indent }'> 
			<input type='hidden' name='ansnum' value='${dto.ansnum }'>
			<!-- 페이지와 검색유지를 위해서 -->
			<input type='hidden' name='col' value='${param.col }'> 
			<input type='hidden' name='word' value='${param.word }'> 
			<input type='hidden' name='nowPage' value='${param.nowPage }'>
			<!-- 부모글 삭제를 막기위해서 -->
			<input type='hidden' name='no' value='${dto.no }'>
			<!-- Form에서 입력값을 넘겨주기위해 -->


			<TABLE>
				<TR>
					<TH class="table-bordered th">성명</TH>
					<TD class="table-bordered td"><input type="text" name="name"></TD>
				</TR>
				<TR>
					<TH class="table-bordered th">제목</TH>
					<TD class="table-bordered td"><input type="text" name="title"
						value="${dto.title }"></TD>
				</TR>
				<TR>
					<TH class="table-bordered th">파일</TH>
					<TD class="table-bordered td"><input type="file"
						name="fileMF"></TD>
				</TR>
				<TR>
					<TH class="table-bordered th">내용</TH>
					<TD class="table-bordered td"><textarea rows="10" cols="45"
							name="content"></textarea></TD>
				</TR>
				<TR>
					<TH class="table-bordered th">비밀번호</TH>
					<TD class="table-bordered td"><input type="password"
						name="passwd"></TD>
				</TR>
			</TABLE>

			<DIV class='bottom'>
				<input type='submit' value='등록' class="button"> <input
					type='button' value='취소' class="button"
					onclick="location.href='./list'">
			</DIV>
		</FORM>
	</div>

</body>
<!-- *********************************************** -->
</html>

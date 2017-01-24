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
<!-- CREATE 할 때 내용이 비어있는지 확인하는 자바스크립트  -->
<script type="text/javascript">
	function input(frm) {
		if (frm.title.value == "" && frm.content.value == "") {
			alert("제목과 내용을 입력해주세요.");
			frm.title.focus();
			return false;
		} else if (frm.title.value == "") {
			alert("제목을 입력해주세요.");
			frm.title.focus();
			return false;
		} else if (frm.content.value == "") {
			alert("내용을 입력해주세요.");
			frm.content.focus();
			return false;
		}
	}
</script>
</head>
<body>
	<div id="w">
		<div class="title"><h3>메모 등록</h3></div>

		<form name="frm" method="POST" action="./create" onsubmit="return input(this)">
			<!-- submit하는걸 잠시멈추고 input()을 호출한다. -->
			<!-- input(this)는 자바스크립트의 this이다. HTML 페이지를 객체형태로 접근할 수 있는 것은 document이다. ( 이 페이지를 가르킴 ) -->
			<!-- 여기서 this는 form 객체 자신을 말한다. form 태그 자체를 개겣로 받는다. -->
			<table class="table_width_40">
				<tr>
					<th class="table-bordered th">제목</th>
					<td class="table-bordered td"><input type="text" name="title" size="30">
					</td>
				</tr>
				<tr>
					<th class="table-bordered th">내용</th>
					<td class="table-bordered td"><textarea name="content" rows="10" cols="30"></textarea>
					</td>
				</tr>
			</table>
			<div class="bottom">
				<input type="submit" class="button" value="등록">
				<input type="button" class="button" value="목록" onclick="location.href='./list.do'">
			</div>
		</form>
	</div>
</body>
</html>

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
	function mcreate() {
		var url = "create";
		location.href = url;
	}

	function mupdate(memono) {
		var url = "update";
		url += "?memono=" + memono;
		url += "&col=${param.col}";
		url += "&word=${param.word}";
		url += "&nowPage=${param.nowPage}";
		location.href = url;
	}

	function mdelete(memono) {
		if (confirm("정말 삭제하시겠습니까?")) {
			var url = "delete";
			url += "?memono=" + memono;
			url += "&col=${param.col}";
			url += "&word=${param.word}";
			url += "&nowPage=${param.nowPage}";
			location.href = url;
		}
	}

	function mlist() {
		var url = "list";
		url += "?col=${param.col}";
		url += "&word=${param.word}";
		url += "&nowPage=${param.nowPage}";
		location.href = url;
	}
</script>
</head>
<body>
	<div id="w">
		<div class="title"><h3>메모 조회</h3></div>
		<table>
			<tr>
				<th class="table-bordered th">제목</th>
				<td class="table-bordered td">${dto.title }</td>
			</tr>
			<tr>
				<th class="table-bordered th">내용</th>
				<td class="table-bordered td">${dto.content }</td>
			</tr>
			<tr>
				<th class="table-bordered th">조회수</th>
				<td class="table-bordered td">${dto.viewcnt }</td>
			</tr>
			<tr>
				<th class="table-bordered th">등록일</th>
				<td class="table-bordered td">${dto.wdate }</td>
			</tr>
		</table>
		<div class="bottom">
			<input type="button" value="등록" class="button" onclick="mcreate()">
			<input type="button" value="수정" class="button"	onclick="mupdate('${dto.memono}')"> 
			<input type="button" value="삭제" class="button" onclick="mdelete('${dto.memono}')"> 
			<input type="button" value="목록" class="button" onclick="mlist()">
		</div>
	</div>
</body>
</html>


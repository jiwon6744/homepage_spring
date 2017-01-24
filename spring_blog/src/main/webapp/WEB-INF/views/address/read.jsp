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
<script type="text/javascript">
	function acreate() {
		var url = "create"
		url += "?col=${param.col}";
		url += "&word=${param.word}";
		url += "&nowPage=${param.nowPage}";
		location.href = url;
	}
	function alist(){
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
		<div class="title"><h3>주소 조회</h3></div>
		<table>
			<tr>
				<th class="table-bordered th">이름</th>
				<td class="table-bordered td">${dto.name }</td>
			</tr>
			<tr>
				<th class="table-bordered th">전화번호</th>
				<td class="table-bordered td">${dto.phone }</td>
			</tr>
			<tr>
				<th class="table-bordered th">주소</th>
				<td class="table-bordered td">${dto.address1 }<br> ${dto.address2 }<br>
					우(${dto.zipcode })</td>
			</tr>
			<tr>
				<th class="table-bordered th">가입날짜</th>
				<td class="table-bordered td">${dto.wdate }</td>
			</tr>
		</table>
		<div class="bottom">
			<input type="button" class="button" value="글쓰기" onclick="acreate()">
			<input type="button" class="button" value="목록" onclick="alist()">
		</div>
	</div>
</body>
</html>

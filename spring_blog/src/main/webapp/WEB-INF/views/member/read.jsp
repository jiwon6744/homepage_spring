<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="util" uri="/ELFunctions" %>

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
	function updateFile() {
		var url = "updateFile";
		url += "?id=${id}";
		url += "&oldfile=${dto.fname}";
		
		location.href = url;
	}
	function updatePw(){
		var url = "updatePw";
		url += "?id=${id}";
		location.href = url;
	}
	function update() {
		var url = "update";
		url += "?id=${id}";
		url += "&col=${param.col}";
		url += "&word=${param.word}";
		url += "&nowPage=${param.nowPage}";
		location.href = url;

	}
	function mdelete() {
		var url = "${pageContext.request.contextPath}/member/delete";
		url += "?id=${id}";
		url += "&col=${param.col}";
		url += "&word=${param.word}";
		url += "&nowPage=${param.nowPage}";
		location.href = url;

	}
	function mlist() {
		var url = "${pageContext.request.contextPath}/admin/list";
		url += "?col=${param.col}";
		url += "&word=${param.word}";
		url += "&nowPage=${param.nowPage}";
		location.href = url;
	}
</script>
</head>
<!-- *********************************************** -->
<body>
<div id="w">
	<div class="title"><h3>${dto.mname }님의 회원 정보</h3>
	</div>

	<table>
		<tr>
			<td colspan="2" class="text-align-c table-bordered td">
				<img src="${pageContext.request.contextPath }/member/storage/${dto.fname}" class="text-align-c" style="width:250px">
			</td>
		</tr>
		<tr>
			<th class="table-bordered th">아이디</th>
			<td class="table-bordered td">${dto.id }</td>
		</tr>
		<tr>
			<th class="table-bordered th">이름</th>
			<td class="table-bordered td">${dto.mname }</td>
		</tr>
		<tr>
			<th class="table-bordered th">전화번호</th>
			<td class="table-bordered td">${dto.tel }</td>
		</tr>
		<tr>
			<th class="table-bordered th">이메일</th>
			<td class="table-bordered td">${dto.email }</td>
		</tr>
		<tr>
			<th class="table-bordered th">우편주소</th>
			<td class="table-bordered td">${dto.zipcode }</td>
		</tr>
		<tr>
			<th class="table-bordered th">주소</th>
			<td class="table-bordered td">${dto.address1 }(${dto.address2 })</td>
		</tr>
		<tr>
			<th class="table-bordered th">직업</th>
			<td class="table-bordered td">
				직업코드:${dto.job }
				(${util:codeValue(dto.job)})
			</td>
		</tr>
		<tr>
			<th class="table-bordered th">날짜</th>
			<td class="table-bordered td">${dto.mdate }</td>
		</tr>
	</table>

	<div class='bottom'>
	<c:choose>
		<c:when test="${not empty id && grade=='A' }">
		<input type='button' value='정보수정' class="button" onclick="update()">
		<input type='button' value='목록' class="button" onclick="mlist()">
		<input type='button' value='다운로드' class="button" onclick="location.href='${pageContext.request.contextPath }/download?dir=/member/storage&filename=${dto.fname }'">
		</c:when>
		<c:otherwise>
		<input type='button' value='정보수정' class="button" onclick="update()">
		<input type='button' value='사진수정' class="button" onclick="updateFile()">
		<input type='button' value='패스워드 변경' class="button" onclick="updatePw()">
		<input type='button' value='회원탈퇴' class="button" onclick="mdelete()">
		<input type='button' value='다운로드' class="button" onclick="location.href='${pageContext.request.contextPath }/download?dir=/member/storage&filename=${dto.fname }'">
		</c:otherwise>
	</c:choose>
	</div>
</div>
</body>
</html>

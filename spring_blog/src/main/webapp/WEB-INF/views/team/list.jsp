<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

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
	function update(teamno) {
		var url = "update";
		url += "?teamno=" + teamno;
		url += "&col=${col}";
		url += "&word=${word}";
		url += "&nowPage=${nowPage}";
		location.href = url;
	}
	function del(teamno,oldfile) {
		if (confirm("정말 삭제하시겠습니까?")) {
			var url = "delete";
			url += "?teamno=" + teamno;
			url += "&col=${col}";
			url += "&word=${word}";
			url += "&nowPage=${nowPage}";
			url += "&oldfile=" + oldfile;
			location.href = url;
		}

	}
	function read(teamno) {
		var url = "read";
		url += "?teamno=" + teamno;
		url += "&col=${col}";
		url += "&word=${word}";
		url += "&nowPage=${nowPage}";
		location.href = url;
	}

	function tcreate() {
		var url = "${pageContext.request.contextPath }/team/create"
		location.href = url;
	}
</script>

</head>
<body>
<div id="w">
	<div class="title"><h3>팀 목록</h3></div>
	<div class="search">
		<form method="post" action="./list.do">
			<select name="col">
				<option value="name"
				<c:if test="${col=='name' }">selected='selected'</c:if>
				>이름</option>
				<option value="phone"
				<c:if test="${col=='phone' }">selected='selected'</c:if>
				>전화번호</option>
				<option value="skill"
				<c:if test="${col=='skill' }">selected='selected'</c:if>
				>보유기술</option>
				<option value="total"
				<c:if test="${col=='total' }">word=""</c:if>
				>전체출력</option>
			</select>
			<input type="text" name="word" value="${word}"/> 
			<input type="submit" class="button_mini" value="검색"> 
			<input type="button" class="button_mini" value="등록" onclick="tcreate()">
		</form>
	</div>
	<table>
		<tr>
			<th class="table-bordered th">번호</th>
			<th class="table-bordered th">이름</th>
			<th class="table-bordered th">전화번호</th>
			<th class="table-bordered th">보유기술</th>
			<th class="table-bordered th">사진</th>
			<th class="table-bordered th">수정/삭제</th>
		</tr>
		<c:choose>
			<c:when test="${fn:length(list)==0 }">
				<tr>
					<td colspan="6" class="table-bordered td text-align-c">등록된 팀정보가 없습니다.</td>
				</tr>
			</c:when>
			<c:otherwise>
				<c:forEach items="${list }" var="dto">
					<tr>
						<td class="table-bordered td text-align-c">${dto.teamno}</td>
						<td class="table-bordered td text-align-c">
							<a href="javascript:read('${dto.teamno }')">${dto.name }</a>
						</td>
						<td class="table-bordered td text-align-c">${dto.phone }</td>
						<td class="table-bordered td text-align-c">${dto.skillstr }</td>
						<td class="table-bordered td text-align-c">
							<img src="${pageContext.request.contextPath }/team/storage/${dto.filename}" style="width:250px">
						</td>
						<td class="table-bordered td text-align-c">
							<a href="javascript:update('${dto.teamno }')">수정 </a> / 
							<a href="javascript:del('${dto.teamno }','${dto.filename }')">삭제</a>
						</td>
					</tr>
				</c:forEach>
			</c:otherwise>
		</c:choose>
	</table>
	<div class='bottom'>
		<!-- 		<input type="button" class="button" value="등록" onclick="tcreate()"> -->
		${paging }
	</div>
</div>
</body>
</html>

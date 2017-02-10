<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
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
	function read(memono) {
		var url = "read";
		url += "?memono=" + memono;
		url += "&col=${col}";
		url += "&word=${word}";
		url += "&nowPage=${nowPage}";

		location.href = url; // url 이동하라
	}
	function create() {
		var url = "${pageContext.request.contextPath }/memo/create";
		url += "?col=${col}";
		url += "&word=${word}";
		url += "&nowPage=${nowPage}";

		location.href = url; // url 이동하라
	}
</script>
</head>
<body>
<section id="list" name="contact"></section>
	<div id="w">
		<div class="title" ><h3>메모 목록</h3></div>
		<div class="search">
			<form method="post" action="./list">
				<select name="col">
					<!-- 검색할 컬럼 -->
					<option value="title"
				<c:if test="${col=='title'}">selected='selected'</c:if>>
				제목</option>
					<option value="content"
				<c:if test="${col=='content'}">selected='selected'</c:if>>
				내용</option>
					<option value="total">전체출력</option>
				</select> <input type="text" name="word" value="${word }" />
				<!-- 검색어 -->
				<input type="submit" class="button_mini" value="검색" />
				<input type="button" class="button_mini" value="등록" onclick="create()" />
			</form>
		</div>

		<table>
			<tr>
				<th class="table-bordered th">번호</th>
				<th class="table-bordered th">제목</th>
				<th class="table-bordered th">날짜</th>
				<th class="table-bordered th">조회수</th>
			</tr>
			<c:choose>
			<c:when test="${fn:length(list)==0 }">
			<tr>
				<td colspan="4" class="table-bordered td text-align-c">등록된 메모가 없습니다.</td>
			</tr>
			</c:when>
			<c:otherwise>
				<c:forEach items="${list }" var="dto">
					<tr>
						<td class="table-bordered td">${dto.memono}</td>
						<td class="table-bordered td">
						<c:set var="rcount" value="${util:rcount(dto.memono,idao) }"/>
						<a href="javascript:read('${dto.memono}')"> ${dto.title}</a>
						<c:if test="${rcount>0 }">
			            	<span style="color:black;">(${rcount})</span>
			          	</c:if>
			          	</td>
						<td class="table-bordered td">${dto.wdate}</td>
						<td class="table-bordered td">${dto.viewcnt}</td>
					</tr>
				</c:forEach>
			</c:otherwise>
			</c:choose>
		</table>
	<div class='bottom'>
		${paging }
	</div>
	</div>
</body>
</html>

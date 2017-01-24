<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
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
	function update(no) {
		var url = "update";
		url += "?no=" + no;
		url += "&col=${col}";
		url += "&word=${word}";
		url += "&nowPage=${nowPage}";
		location.href = url;
	}
	function del(no) {
		if (confirm("정말 삭제하시겠습니까?")) {
			var url = "delete";
			url += "?no=" + no;
			url += "&col=${col}";
			url += "&word=${word}";
			url += "&nowPage=${nowPage}";
			location.href = url;
		}
	}
	function read(no) {
		var url = "read";
		url += "?no=" + no;
		url += "&col=${col}";
		url += "&word=${word}";
		url += "&nowPage=${nowPage}";
		location.href = url;
	}
	function create() {
		var url = "${pageContext.request.contextPath}/address/create"
		url += "?col=${col}";
		url += "&word=${word}";
		url += "&nowPage=${nowPage}";
		location.href = url;
	}
</script>
</head>
<body>
<section id="list" name="contact"></section>
	<div id="w">
		<div class="title"><h3>회원 정보</h3></div>
		<div class="search">
			<form method="post" action="./list">
				<select name="col">
					<!-- 검색할 컬럼 -->
					<option value="name"
				<c:if test="${col=='name' }">selected=='selected'</c:if>>
				이름</option>
					<option value="phone"
				<c:if test="${col=='phone' }">selected=='selected'</c:if>>
				번호</option>
					<option value="zipcode"
				<c:if test="${col=='zipcode' }">selected=='selected'</c:if>>
				우편</option>
					<option value="total"
				<c:if test="${col=='total' }">word=""</c:if>>	
				전체출력</option>
				</select> 
				
				<input type="text" name="word" value="${word }" />
				<!-- 검색어 -->
				<input type="submit" class="button_mini" value="검색" />
				<input type="button" class="button_mini" value="등록" onclick="create()"/>
			</form>
		</div>
		<table>
			<tr>
				<th class="table-bordered th text-align-c">번호</th>
				<th class="table-bordered th">이름</th>
				<th class="table-bordered th">전화번호</th>
				<th class="table-bordered th">가입날짜</th>
				<th class="table-bordered th">수정/삭제</th>
			</tr>
			<c:choose>
			<c:when test="${fn:length(list)==0}">
				<tr>
					<td colspan="6" class="text-align-c">등록된 회원 정보가 없습니다.</td>
				</tr>
			</c:when>
			<c:otherwise>
				<c:forEach items="${list }" var="dto">
					<tr>
						<td class="table-bordered td text-align-c">${dto.no }</td>
						<td class="table-bordered td"><a href="javascript:read('${dto.no }')">${dto.name }</a>
						</td>
						<td class="table-bordered td">${dto.phone }</td>
						<td class="table-bordered td">${dto.wdate }</td>
						<td class="table-bordered td text-align-c"><a
							href="javascript:update('${dto.no }')">수정 </a> / <a
							href="javascript:del('${dto.no }')">삭제</a></td>
					</tr>
				</c:forEach>
			</c:otherwise>
			</c:choose>
		</table>
		<div class="bottom">
<!-- 			<input type="button" class="button" value="등록" onclick="location.href='./createForm.do'"> -->
			${paging }
		</div>
	</div>
</body>
</html>

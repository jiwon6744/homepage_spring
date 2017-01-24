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
function read(id) {
	var url = "${pageContext.request.contextPath}/member/read";
	url += "?id="+id;
	url += "&nowPage=${nowPage}";
	url += "&col=${col}";
	url += "&word=${word}";
	
	location.href = url;
}
</script>
</head>
<!-- *********************************************** -->
<body>
<div id="w">
	<div class="title"><h3>회원목록</h3></div>
	<div class="search">
		<form name='frm' method='POST' action='./list'>
			<select name="col">
				<option value="mname" 
				<c:if test="${col=='mname' }">selected='selected'</c:if>
				>성명</option>
				<option value="email"
				<c:if test="${col=='email' }">selected='selected'</c:if>
				>이메일</option>
				<option value="id"
				<c:if test="${col=='id' }">selected='selected'</c:if>
				>아이디</option>
				<option value="total"
				<c:if test="${col=='total' }">word=""</c:if>
				>전체출력</option>
			</select>
			<input type="text" name="word" value='${word }'> 
			<input type="submit" class="button_mini" value="검색"> 
			<input type="button" class="button_mini" value="회원가입" onclick="location.href='${pageContext.request.contextPath}/member/agree'">
		</form>
	</div>
	<c:forEach items="${list }" var="dto">
	<table class="table">
		<tr>
			<td rowspan="5" width="30%">
			<img src='${pageContext.request.contextPath }/member/storage/${dto.fname}' style="width:250px">
			</td>
			<th width="20%">아이디</th>
			<td width="50%">
			<a href="javascript:read('${dto.id }')">${dto.id }</a>
			</td>
		</tr>
		<tr>
			<th>성명</th>
			<td>${dto.mname }</td>
		</tr>
		<tr>
			<th>전화번호</th>
			<td>${dto.tel }</td>
		</tr>
		<tr>
			<th>이메일</th>
			<td>${dto.email }</td>
		</tr>
		<tr>
			<th>주소</th>
			<td>${dto.address1 }
				(${dto.address2 })</td>

		</tr>
	</table>
	</c:forEach>
	
	<div class='bottom'>
		${paging }
	</div>
</div>
</body>
</html>

<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="util" uri="/ELFunctions" %>

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
<meta name="viewport" content="width=device-width, initial-scale=1">
<script type="text/javascript">
	function read(bbsno) {
		var url = "read";
		url += "?bbsno=" + bbsno;
		url += "&col=${col}";
		url += "&word=${word}";
		url += "&nowPage=${nowPage}";
		location.href = url;
	}
	function create() {
		var url = "${pageContext.request.contextPath }/bbs/create"
		url += "?col=${col}";
		url += "&word=${word}";
		url += "&nowPage=${nowPage}";
		location.href = url;
	}
	function down(filename) {
		var url = "${pageContext.request.contextPath}/download";
		url += "?dir=/bbs/storage";
		url += "&filename=" + filename;
		location.href = url;
	}
</script>
</head>
<body>
	<div id="w">
		<div class="title">
			<h3>게시판 목록</h3>
		</div>

		<div class="search">
			<form method="post" action="./list">
				<select name="col">
					<!-- 검색할 컬럼 -->
					<option value="wname"
						<c:if test="${col=='wname'}">selected='selected'</c:if>>성명</option>
					<option value="title"
						<c:if test="${col=='title'}">selected='selected'</c:if>>제목</option>
					<option value="cotent"
						<c:if test="${col=='cotent'}">selected='selected'</c:if>>내용</option>
					<option value="total">전체출력</option>
				</select> 
				<input type="text" name="word" value="${word}" />
				<!-- 검색어 -->
				<input type="submit" class="button_mini" value="검색" />
				<input type="button" class="button_mini" value="등록" onclick="create()" />
			</form>
		</div>
		<table>
			<tr>
				<th class="table-bordered th text-align-c">번호</th>
				<th class="table-bordered th text-align-c">제목</th>
				<th class="table-bordered th text-align-c">성명</th>
				<th class="table-bordered th text-align-c">조회수</th>
				<th class="table-bordered th text-align-c">등록일</th>
				<th class="table-bordered th text-align-c">파일명</th>
			</tr>
			<c:choose>
				<c:when test="${fn:length(list)==0}">
					<tr>
						<td colspan="8" class="table-bordered td text-align-c">등록된 글이 없습니다.</td>
					</tr>
				</c:when>
				<c:otherwise>
					<c:forEach items="${list }" var="dto">
						<tr>
							<td class="table-bordered td text-align-c">${dto.bbsno}</td>
							<td class="table-bordered td"><c:forEach begin="1" end="${dto.indent}">
									<c:out value="&nbsp;&nbsp;" escapeXml="false"></c:out>
								</c:forEach> 
								<c:if test="${dto.indent>0 }">
									<img src="${pageContext.request.contextPath }/images/reply-back.png" width="5%">
								</c:if> 
								<c:set var="rcount" value="${util:rcount(dto.bbsno,idao) }"/>
								<a href="javascript:read('${dto.bbsno }')"> ${dto.title }</a> 
						        <c:if test="${rcount>0 }">
					  	          <span style="color:black;">(${rcount})</span>
						        </c:if>
								<c:if test="${util:newImg(fn:substring(dto.wdate,0,10)) }">
								<img src="${pageContext.request.contextPath }/images/new.gif">
								</c:if>
								
								
							</td>
							<td class="table-bordered td">${dto.wname }</td>
							<td class="table-bordered td text-align-c">${dto.viewcnt }</td>
							<td class="table-bordered td text-align-c">${fn:substring(dto.wdate,0,10) }</td>
							<td class="table-bordered td text-align-c"><c:choose>
									<c:when test="${empty dto.filename }">파일없음</c:when>
									<c:otherwise>
										<a href="javascript:down('${dto.filename }')"> 
										<span class="glyphicon glyphicon-download"></span></a>
									</c:otherwise>
								</c:choose></td>
						</tr>
					</c:forEach>
				</c:otherwise>
			</c:choose>
		</table>
		<div class='bottom'>${paging }</div>
	</div>
</body>
</html>

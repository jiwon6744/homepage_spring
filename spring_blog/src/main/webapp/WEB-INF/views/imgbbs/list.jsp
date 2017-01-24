<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="util" uri="/ELFunctions"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
<script type="text/javascript">
	function read(no) {
		var url = "${pageContext.request.contextPath}/imgbbs/read";
		url += "?no=" + no;
		url += "&nowPage=${nowPage}";
		url += "&col=${col}";
		url += "&word=${word}";
		location.href = url;
	}
	function create() {
		var url = "${pageContext.request.contextPath }/imgbbs/create";
		url += "?nowPage=${nowPage}";
		url += "&col=${col}";
		url += "&word=${word}";
		location.href = url;
	}
	function down(filename) {
		var url = "${pageContext.request.contextPath}/download";
		url += "?dir=/imgbbs/storage";
		url += "&filename=" + filename;
		location.href = url;
	}

</script>
</head>
<link rel="stylesheet" href="${pageContext.request.contextPath }/assets/css/font-awesome.min.css">
<link href="${pageContext.request.contextPath }/assets/css/bootstrap.css" rel="stylesheet">
<link href="${pageContext.request.contextPath }/assets/css/main.css" rel="stylesheet">
<link href='http://fonts.googleapis.com/css?family=Lato:300,400,700,300italic,400italic' rel='stylesheet' type='text/css'>
<link href='http://fonts.googleapis.com/css?family=Raleway:400,300,700' rel='stylesheet' type='text/css'>
<body>
<section id="list" name="list"></section>
	<div id="w">
		<DIV class="title">
			<h3>이미지 게시판</h3>
		</DIV>
		<DIV class="search">
			<FORM name='frm' method='POST' action='./list'>
				<SELECT name="col">
					<option value="name"
						<c:if test="${col=='name' }">selected='selected'</c:if>>성명</option>
					<option value="title"
						<c:if test="${col=='title' }">selected='selected'></c:if>>제목</option>
					<option value="content"
						<c:if test="${col=='content' }">selected='selected'></c:if>>내용</option>
					<option value="total"
						<c:if test="${col=='total' }">selected='selected'></c:if>>전체출력</option>

				</SELECT> <input type="text" name="word" value='${word }'> <input
					type="submit" value="검색" class="button"> <input
					type="button" value="등록" class="button"
					onclick="create()">
			</FORM>
		</DIV>
		<TABLE style="width: 80%;">
			<TR>
				<TH class="table-bordered th">번호</TH>
				<TH class="table-bordered th">제목</TH>
				<TH class="table-bordered th">글쓴이</TH>
				<TH class="table-bordered th">조회수</TH>
				<TH class="table-bordered th">등록일</TH>
				<TH class="table-bordered th">이미지</TH>
			</TR>
			<c:choose>
				<c:when test="${fn:length(list)==0 }">
					<tr>
						<td colspan="8" class="text-align-c">등록된 글이 없습니다.</td>
					</tr>
				</c:when>
				<c:otherwise>
					<c:forEach items="${list }" var="dto">
						<tr>
							<td class="table-bordered td text-align-c">${dto.no }</td>
							<td class="table-bordered td text-align-c">
							<c:forEach begin="1" end="${dto.indent }">
									<c:out value="&nbsp;&nbsp;" escapeXml="false"></c:out>
								</c:forEach> <c:if test="${dto.indent > 0 }">
									<img src="${pageContext.request.contextPath }/images/reply-back.png" width="5%">
								</c:if> 
								<a href="javascript:read('${dto.no }')"> ${dto.title }</a> 
								<c:if test="${util:newImg(fn:substring(dto.wdate,0,10)) }">
									<img src="${pageContext.request.contextPath }/imgbbs/images/new.gif">
								</c:if></td>
							<td class="table-bordered td text-align-c">${dto.name }</td>
							<td class="table-bordered td text-align-c">${dto.viewcnt }</td>
							<td class="table-bordered td text-align-c">${fn:substring(dto.wdate,0,10) }</td>
							<td class="table-bordered td text-align-c">
							<c:choose>
							<c:when test="${empty dto.filename }">
								이미지 없음
							</c:when> 
							<c:otherwise>
									<a href="javascript:down('${dto.filename }')"> 
									<img src="${pageContext.request.contextPath }/imgbbs/storage/${dto.filename}"
										style="width: 250px">
									</a>
								</c:otherwise>
							</c:choose>
							</td>
						</tr>
					</c:forEach>
				</c:otherwise>
			</c:choose>
		</TABLE>
		<DIV class='bottom'>${paging }</DIV>
	</div>
</body>
<!-- *********************************************** -->
</html>

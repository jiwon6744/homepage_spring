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
<style type="text/css">
.rcreate {
	font-size: 20px;
	font-weight: bold;
	text-align: left;
	border-style: solid; /* 실선 */
	border-width: 1px; /* 선 두께 */
	border-color: #AAAAAA; /* 선 색깔 */
	color: #000000; /* 글자 색깔 */
	width: 35%; /* 화면의 30% */
	padding: 10px; /* 위 오른쪽 아래 왼쪽: 시간 방향 적용 */
	/* padding: 50px 10px;  50px: 위 아래, 10px: 좌우 */
	/* padding-top: 30px;  상단만 간격을 30px 지정   */
	margin: 20px auto; /* 가운데 정렬 기능, 20px: 위 아래, auto: 오른쪽 왼쪽*/
}

.rlist {
	line-height: 1.2em;
	font-size: 15px;
	font-weight: bold;
	text-align: left;
	border-style: solid; /* 실선 */
	border-width: 1px; /* 선 두께 */
	border-color: #AAAAAA; /* 선 색깔 */
	color: #000000; /* 글자 색깔 */
	width: 35%; /* 화면의 30% */
	padding: 10px; /* 위 오른쪽 아래 왼쪽: 시간 방향 적용 */
	/* padding: 50px 10px;  50px: 위 아래, 10px: 좌우 */
	/* padding-top: 30px;  상단만 간격을 30px 지정   */
	margin: 20px auto; /* 가운데 정렬 기능, 20px: 위 아래, auto: 오른쪽 왼쪽*/
}

hr {
	text-align: center;
	border-style: solid; /* 실선 */
	border-width: 1px; /* 선 두께 */
	border-color: #AAAAAA; /* 선 색깔 */
	width: 45%; /* 화면의 30% */
}
</style>
<script type="text/javascript">
	//댓글관련자바스크립트 시작
	function rcheck(tarea) {
		if ('${sessionScope.id}' == "") {
			if (confirm("로그인후 댓글를 쓰세요")) {
				var url = "../member/login";
				url = url + "?bbsno=${dto.bbsno}";
				url = url + "&nowPage=${param.nowPage}";
				url = url + "&nPage=${nPage}";
				url = url + "&col=${param.col}";
				url = url + "&word=${param.word}";
				url = url + "&bflag=../bbs/read";
				location.href = url;
			} else {
				tarea.blur();
			}
		}
	}
	function input(f) {
		if ('${sessionScope.id}' == "") {
			if (confirm("로그인후 댓글를 쓰세요")) {
				var url = "../member/login";
				url = url + "?bbsno=${dto.bbsno}";
				url = url + "&nowPage=${param.nowPage}";
				url = url + "&nPage=${nPage}";
				url = url + "&col=${param.col}";
				url = url + "&word=${param.word}";
				url = url + "&flag=../bbs/read";
				location.href = url;
				return false;
			} else {

				return false;
			}
		} else if (f.content.value == "") {
			alert("댓글 내용을 입력하세요.");
			f.content.focus();
			return false;
		}
	}
	function rupdate(rnum, rcontent) {
		var f = document.rform;
		f.content.value = rcontent;
		f.rnum.value = rnum;
		f.rsubmit.value = "수정";
		f.action = "./rupdate"
	}
	function rdelete(rnum) {
		if (confirm("정말 삭제 하겠습니까?")) {
			var url = "./rdelete";
			url = url + "?rnum=" + rnum;
			url = url + "&bbsno=${dto.bbsno}";
			url = url + "&nowPage=${param.nowPage}";
			url = url + "&nPage=${nPage}";
			url = url + "&col=${param.col}";
			url = url + "&word=${param.word}";
			location.href = url;
		}
	}
	//댓글관련자바스크립트 끝
	function blist() {
		var url = "list";
		url += "?col=${param.col}";
		url += "&word=${param.word}";
		url += "&nowPage=${param.nowPage}";

		location.href = url;
	}
	function bupdate() {
		var url = "update";
		url += "?bbsno=${dto.bbsno}";
		url += "&col=${param.col}";
		url += "&word=${param.word}";
		url += "&nowPage=${param.nowPage}";

		location.href = url;
	}
	function bdelete() {
		var url = "delete"
		url += "?bbsno=${dto.bbsno}";
		url += "&col=${param.col}";
		url += "&word=${param.word}";
		url += "&nowPage=${param.nowPage}";
		url += "&oldfile=${dto.filename}";

		location.href = url;
	}
	function breply() {
		var url = "reply";
		url += "?bbsno=${dto.bbsno}";
		url += "&col=${param.col}";
		url += "&word=${param.word}";
		url += "&nowPage=${param.nowPage}";

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
<!-- *********************************************** -->
<body>
	<!-- *********************************************** -->
<div id="w">
	<div class="title"><h3>게시판 조회</h3></div>

	<table>
		<tr>
			<th class="table-bordered th">제목</th>
			<td class="table-bordered td">${dto.title }</td>
		</tr>
		<tr>
			<td colspan="2" class="table-bordered td">${dto.content }</td>
		</tr>
		<tr>
			<th class="table-bordered th">성명</th>
			<td class="table-bordered td">${dto.wname }</td>
		</tr>
		<tr>
			<th class="table-bordered th">조회수</th>
			<td class="table-bordered td">${dto.viewcnt }</td>
		</tr>
		<tr>
			<th class="table-bordered th">등록</th>
			<td class="table-bordered td">${fn:substring(dto.wdate,0,10) }</td>
		</tr>
		<tr>
			<th class="table-bordered th">파일</th>
			<td class="table-bordered td">
				<c:choose>
					<c:when test="${empty dto.filename }">
						파일없음
					</c:when>
					<c:otherwise>
						${dto.filename }( ${dto.filesize div 1024})KB)
						<a href="javascript:down('${dto.filename }')">
						<span class="glyphicon glyphicon-download-alt"></span>
						</a>
					</c:otherwise>
				</c:choose>
			</td>
		</tr>
	</table>

	<div class='bottom'>
		<input type='button' value='등록' class="button" onclick="location.href='./create'"> 
		<input type='button' value='목록' class="button" onclick="blist()"> 
		<input type='button' value='수정' class="button" onclick="bupdate()"> 
		<input type='button' value='삭제' class="button" onclick="bdelete()"> 
		<input type='button' value='답변' class="button" onclick="breply()">
	</div>
	<c:forEach var="rdto" items="${rlist}">
		<div class="rlist">
			${rdto.id}<br />
			<p>${rdto.content}</p>
			${rdto.regdate}
			<c:if test="${sessionScope.id==rdto.id }">
				<span style="float: right;"> <a
					href="javascript:rupdate('${rdto.rnum}','${rdto.content }')">
						수정</a>|<a href="javascript:rdelete('${rdto.rnum}')">삭제</a>
				</span>
			</c:if>
		</div>
	</c:forEach>
	<div class="rcreate">
		<form name="rform" action="./rcreate" method="post"
			onsubmit="return input(this)">
			<textarea rows="3" cols="28" name="content" onclick="rcheck(this)"></textarea>
			</br>
			<input type="submit" name="rsubmit" class="button_mini" value="등록"> <input
				type="hidden" name="bbsno" value="${dto.bbsno}"> <input
				type="hidden" name="id" value="${sessionScope.id}"> <input
				type="hidden" name="nowPage" value="${param.nowPage}"> <input
				type="hidden" name="nPage" value="${nPage}"> <input
				type="hidden" name="col" value="${param.col}"> <input
				type="hidden" name="word" value="${param.word}"> <input
				type="hidden" name="rnum" value="0">
		</form>
	</div>
	<div class="bottom">${paging}</div>
</div>
</body>
</html>

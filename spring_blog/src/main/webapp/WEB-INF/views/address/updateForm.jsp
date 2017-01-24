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
function alist() {
	var url = "list";
	url += "?col=${param.col}";
	url += "&word=${param.word}";
	url += "&nowPage=${param.nowPage}";
	location.href = url;
}
	function input(f) {
		if (f.name.value == "") {
			alert("이름을 입력하세요");
			f.name.focus();
			return false;
		}
		if (f.phone.value == "") {
			alert("전화번호를 입력하세요.");
			f.phone.focus();
			return false;
		}
		if (f.zipcode.value == "") {
			alert("우편번호를 입력하세요.");
			f.zipcode.focus();
			return false;
		}
		if (f.address1.value == "") {
			alert("주소를 입력해주세요.");
			f.address1.focus();
			return false;
		}
		if (f.address2.value == "") {
			alert("상세주소를 입력해주세요.");
			f.address2.focus();
			return false;
		}
	}
</script>
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script>
	function sample6_execDaumPostcode() {
		new daum.Postcode(
				{
					oncomplete : function(data) {
						// 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

						// 각 주소의 노출 규칙에 따라 주소를 조합한다.
						// 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
						var fullAddr = ''; // 최종 주소 변수
						var extraAddr = ''; // 조합형 주소 변수

						// 사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
						if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
							fullAddr = data.roadAddress;

						} else { // 사용자가 지번 주소를 선택했을 경우(J)
							fullAddr = data.jibunAddress;
						}

						// 사용자가 선택한 주소가 도로명 타입일때 조합한다.
						if (data.userSelectedType === 'R') {
							//법정동명이 있을 경우 추가한다.
							if (data.bname !== '') {
								extraAddr += data.bname;
							}
							// 건물명이 있을 경우 추가한다.
							if (data.buildingName !== '') {
								extraAddr += (extraAddr !== '' ? ', '
										+ data.buildingName : data.buildingName);
							}
							// 조합형주소의 유무에 따라 양쪽에 괄호를 추가하여 최종 주소를 만든다.
							fullAddr += (extraAddr !== '' ? ' (' + extraAddr
									+ ')' : '');
						}

						// 우편번호와 주소 정보를 해당 필드에 넣는다.
						document.getElementById('sample6_postcode').value = data.zonecode; //5자리 새우편번호 사용
						document.getElementById('sample6_address').value = fullAddr;

						// 커서를 상세주소 필드로 이동한다.
						document.getElementById('sample6_address2').focus();
					}
				}).open();
	}
</script>
</head>
<body>
<div id="w">
	<div class="title"><h3>회원가입</h3></div>
	<form action="./update" method="POST" onsubmit="return input(this)">
		<input type="hidden" name="no" value="${param.no }"> 
		<input type="hidden" name="col" value="${param.col }">
		<input type="hidden" name="word" value="${param.word }">
		<input type="hidden" name="nowPage" value="${param.nowPage }">
		<table>
			<tr>
				<th class="table-bordered th">이름</th>
				<td class="table-bordered td">
					<input type="text" name="name" autofocus="autofocus" value="${dto.name }" />
				</td>
			</tr>
			<tr>
				<th class="table-bordered th">전화번호</th>
				<td class="table-bordered td">
					<input type="text" name="phone" value="${dto.phone }" />
				</td>
			</tr>
			<tr>
				<th class="table-bordered th">우편번호</th>
				<td class="table-bordered td">
					<input type="text" name="zipcode" size="7" maxlength="5" id="sample6_postcode" class="width100" value="${dto.zipcode }" /> 
					<input type="button" onclick="sample6_execDaumPostcode()" class="button_mini" value="우편번호 찾기" />
				</td>
			</tr>
			<tr>
				<th class="table-bordered th">주소</th>
				<td class="table-bordered td">
					<input type="text" name="address1" size="45" id="sample6_address" value="${dto.address1 }" />
				</td>
			</tr>
			<tr>
				<th class="table-bordered th">상세주소</th>
				<td class="table-bordered td">
					<input type="text" name="address2" size="45" id="sample6_address2" value="${dto.address2 }" />
				</td>
			</tr>
		</table>
		<div class="bottom">
			<input type="submit" class="button" value="수정" /> 
			<input type="reset" class="button" value="다시입력" /> 
			<input type="button" class="button" value="목록" onclick="alist()" />
		</div>
	</form>
</div>
</body>
</html>

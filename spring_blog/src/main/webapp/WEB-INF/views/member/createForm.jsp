<%@ page contentType="text/html; charset=UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입</title>
<link rel="shortcut icon" href="${pageContext.request.contextPath }/assets/ico/favicon.png">
<link rel="stylesheet" href="${pageContext.request.contextPath }/assets/css/font-awesome.min.css">
<link href="${pageContext.request.contextPath }/assets/css/bootstrap.css" rel="stylesheet">
<link href="${pageContext.request.contextPath }/assets/css/main.css" rel="stylesheet">
<link href='http://fonts.googleapis.com/css?family=Lato:300,400,700,300italic,400italic' rel='stylesheet' type='text/css'>
<link href='http://fonts.googleapis.com/css?family=Raleway:400,300,700' rel='stylesheet' type='text/css'>
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script>
    function sample6_execDaumPostcode() {
        new daum.Postcode({
            oncomplete: function(data) {
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
                if(data.userSelectedType === 'R'){
                    //법정동명이 있을 경우 추가한다.
                    if(data.bname !== ''){
                        extraAddr += data.bname;
                    }
                    // 건물명이 있을 경우 추가한다.
                    if(data.buildingName !== ''){
                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                    }
                    // 조합형주소의 유무에 따라 양쪽에 괄호를 추가하여 최종 주소를 만든다.
                    fullAddr += (extraAddr !== '' ? ' ('+ extraAddr +')' : '');
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
<script type="text/javascript">
	function inputCheck(f) {
		if(f.id.value==""){
			alert("아이디를 입력해주세요.");
			f.id.focus(); // 그 쪽으로 화면을 잡아준다.
			return false; // submit을 막아 준다.
		}
		if(f.passwd.value==""){
			alert("비밀번호를 입력해주세요.");
			f.passwd.focus();
			return false;
		}
		if(f.repasswd.value==""){
			alert("비밀번호 확인을 입력해주세요.");
			f.repasswd.focus();
			return false;
		}
		if(f.passwd.value != f.repasswd.value){
			alert("비밀번호가 일치하지 않습니다. 다시 확인해주세요.");
			f.passwd.focus();
			return false;
		}
		if(f.mname.value==""){
			alert("이름을 입력해주세요.");
			f.mname.focus();
			return false;
		}
		if(f.email.value==""){
			alert("이메일을 입력해주세요.");
			f.email.focus();
			return false;
		}
		if(f.job.value=="0"){
			alert("직업을 입력해주세요.");
			f.job.focus();
			return false;
		}
	}

	function idCheck(id){
		if(id==""){
			alert("아이디를 입력 해주세요.");
			document.frm.id.focus();
		}else{
		var url = "id_proc";
		url+="?id="+id;
		
		var wr = window.open(url,"아이디검색","width=500,height=500");//(새창에서 보여줄 페이지,새창의 제목,새창의 크기)
		wr = moveTo((window.screen.width-500),(window.screen.height-300));
		}
	}
	function emailCheck(email){
		if(email==""){
			alert("메일을 입력해주세요.");
			document.frm.email.focus();
		}else{
			var url = "email_proc";
			url+="?email="+email; // 파라미터를 가지고 가야 하며, url 과 구분을 해줘야함.
			
			var wr = window.open(url,"이메일검색","width=500,height=500");
			wr = moveTo((window.scrren.width-500),(window.screen.height-300));
		}
	}
</script>
</head>
<body>
<div id="w" class="">
	<div class="title"><h3>회원가입</h3></div>

	<form name='frm' 
		  method='POST'
		  action='./create'
		  enctype="multipart/form-data"
		  onsubmit="return inputCheck(this)">
		<table>
			<tr>
				<th class="table-bordered th">사진</th>
				<td class="table-bordered td"><input type="file" name="fnameMF" accept=".jpg,.png,.gif"></td>
				<td class="table-bordered td">사진은 jpg, png, gif파일만 올려주세요.</td>
			</tr>
			<tr>
				<th class="table-bordered th">*아이디</th>
				<td class="table-bordered td"><input type="text" name="id" size="15">
				<input type="button" class="button_mini" value="ID중복확인" onclick="idCheck(document.frm.id.value)">
				</td>
				<td class="table-bordered td">아이디를 적어주세요.</td>
			</tr>
			<tr>
				<th class="table-bordered th">*패스워드</th>
				<td class="table-bordered td">
					<input type="password" name="passwd" size="15">
				</td>
				<td class="table-bordered td">패스워드를 적어주세요.</td>
			</tr>
			<tr>
				<th class="table-bordered th">*패스워드 확인</th>
				<td class="table-bordered td">
					<input type="password" name="repasswd" size="15">
				</td>
				<td class="table-bordered td">패스워드를 확인합니다.</td>
			</tr>
			<tr>
				<th class="table-bordered th">*이름</th>
				<td class="table-bordered td">
					<input type="text" name="mname" size="15">
				</td>
				<td class="table-bordered td">고객 실명을 적어주세요.</td>
			</tr>
			<tr>
				<th class="table-bordered th">전화번호</th>
				<td class="table-bordered td">
					<input type="text" name="tel" size="15">
				</td>
				<td class="table-bordered td"></td>
			</tr>
			<tr>
				<th class="table-bordered th">*이메일</th>
				<td class="table-bordered td">
					<input type="text" name="email" size="20">
					<input type="button" class="button_mini" value="Email중복확인" onclick="emailCheck(document.frm.email.value)">
				</td>
				<td class="table-bordered td">이메일을 적어주세요.</td>
			</tr>
			<tr>
				<th class="table-bordered th">우편번호</th>
				<td class="table-bordered td">
					<input type="text" name="zipcode" size="7" id="sample6_postcode" placeholder="우편번호"> 
					<input type="button" class="button_mini" value="우편번호찾기" onclick="sample6_execDaumPostcode()">
				</td>
				<td class="table-bordered td"></td>
			</tr>
			<tr>
				<th class="table-bordered th">주소</th>
				<td class="table-bordered td">
					<input type="text" name="address1" size="40" id="sample6_address" placeholder="주소"> 
					<input type="text" name="address2" size="40" id="sample6_address2" placeholder="상세주소">
				</td>
				<td class="table-bordered td"></td>
			</tr>
			<tr>
				<th class="table-bordered th">*직업</th>
				<td class="table-bordered td">
					<select name="job">
						<option value="0" selected>선택하세요</option>
						<option value="A01">회사원</option>
						<option value="A02">전산관련직</option>
						<option value="A03">연구전문직</option>
						<option value="A04">각종학교학생</option>
						<option value="A05">일반자영업</option>
						<option value="A06">공무원</option>
						<option value="A07">의료인</option>
						<option value="A08">법조인</option>
						<option value="A09">종교/언론/예술인</option>
						<option value="A10">기타</option>
					</select>
				</td>
				<td class="table-bordered td">직업을 선택하세요.</td>
			</tr>
		</table>
		<div class='bottom'>
			<input type='submit' value='회원가입' class="button" > 
			<input type='button' value='취소' class="button" onclick="history.go(-2);">
		</div>
	</form>
</div>
</body>
</html>

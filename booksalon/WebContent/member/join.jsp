<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>북쌀롱 | 회원가입</title>
<link href="../css/default.css" rel="stylesheet" type="text/css">
<link href="../css/subpage.css" rel="stylesheet" type="text/css">
<link
	href="https://fonts.googleapis.com/css?family=Nanum+Gothic|Nanum+Gothic+Coding|Noto+Serif+KR|Caveat+Brush&display=swap"
	rel="stylesheet">
<link href="vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
<link href="vendor/fontawesome-free/css/all.min.css" rel="stylesheet"
	type="text/css">
<link href="https://fonts.googleapis.com/css?family=Montserrat:400,700"
	rel="stylesheet" type="text/css">
<link href='https://fonts.googleapis.com/css?family=Kaushan+Script'
	rel='stylesheet' type='text/css'>
<link
	href='https://fonts.googleapis.com/css?family=Droid+Serif:400,700,400italic,700italic'
	rel='stylesheet' type='text/css'>
<link
	href='https://fonts.googleapis.com/css?family=Roboto+Slab:400,100,300,700'
	rel='stylesheet' type='text/css'>

<script
	src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script type="text/javascript">
	function joincheck() {
		if (document.fr.id.value == "") {
			alert("아이디 입력하세요");
			document.fr.id.focus();
			return false;
		}
		if (document.fr.id.value.length<4 || document.fr.id.value.length>10) {
			alert("아이디는 4~10자입니다.");
			document.fr.id.focus();
			return false;
		}		
		if (document.fr.id.value.indexOf(" ") >= 0) {
	        alert("아이디에 공백을 사용할 수 없습니다.")
	        document.fr.id.focus();
	        return false;
	    }     
		if(document.fr.dupChecked.value=="dupChecked"){
			alert("아이디 중복체크 하세요");
			document.fr.dupChecked.focus();
			return false;
		}
		
		if (document.fr.pass.value == "") {
			alert("비밀번호 입력하세요");
			document.fr.pass.focus();
			return false;
		}
		if (document.fr.pass.value.length<4 || document.fr.pass.value.length>15) {
			alert("비밀번호는 4~15자입니다.");
			document.fr.id.focus();
			return false;
		}		
		if (document.fr.pass.value.indexOf(" ") >= 0) {
	        alert("비밀번호에 공백을 사용할 수 없습니다.")
	        document.fr.pass.focus();
	        document.fr.pass.select();
	        return false;
	    }     
		
		if (document.fr.pass2.value == "") {
			alert("비밀번호 확인 입력하세요");
			document.fr.pass2.focus();
			return false;
		}
		if (document.fr.pass.value !== document.fr.pass2.value) {
			alert("비밀번호가 일치하지 않습니다");
			document.fr.pass2.focus();
			return false;
		}
		if (document.fr.name.value == "") {
			alert("이름 입력하세요");
			document.fr.name.focus();
			return false;
		}
		if (document.fr.email.value == "") {
			alert("메일 입력하세요");
			document.fr.email.focus();
			return false;
		}
	}

	function dupcheck() {
			
		if (document.fr.id.value == "") {
			alert("아이디 입력하세요");
			return;
		}if (!(document.fr.id.value.length>=4 && document.fr.id.value.length<=10)) {
			alert("아이디는 4~10자입니다.");
			document.fr.id.focus();
			return;
		}		
		if (document.fr.id.value.indexOf(" ") >= 0) {
	        alert("아이디에 공백을 사용할 수 없습니다.")
	        document.fr.id.focus();
	        return;
	    }     
// 			dc=docuemnt.fr.dupChecked.value;
			window.open("dupcheck.jsp?id="+document.fr.id.value,"중복체크",
					"width=400,height=200, top=100, left=100");
		
		}
	

	function sample6_execDaumPostcode() {
		new daum.Postcode(
				{
					oncomplete : function(data) {
						// 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

						// 각 주소의 노출 규칙에 따라 주소를 조합한다.
						// 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
						var addr = ''; // 주소 변수
						var extraAddr = ''; // 참고항목 변수

						//사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
						if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
							addr = data.roadAddress;
						} else { // 사용자가 지번 주소를 선택했을 경우(J)
							addr = data.jibunAddress;
						}

						// 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
						if (data.userSelectedType === 'R') {
							// 법정동명이 있을 경우 추가한다. (법정리는 제외)
							// 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
							if (data.bname !== ''
									&& /[동|로|가]$/g.test(data.bname)) {
								extraAddr += data.bname;
							}
							// 건물명이 있고, 공동주택일 경우 추가한다.
							if (data.buildingName !== ''
									&& data.apartment === 'Y') {
								extraAddr += (extraAddr !== '' ? ', '
										+ data.buildingName : data.buildingName);
							}
							// 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
							if (extraAddr !== '') {
								extraAddr = ' (' + extraAddr + ')';
							}
							// 조합된 참고항목을 해당 필드에 넣는다.
							document.getElementById("sample6_extraAddress").value = extraAddr;

						} else {
							document.getElementById("sample6_extraAddress").value = '';
						}

						// 우편번호와 주소 정보를 해당 필드에 넣는다.
						document.getElementById("sample6_postcode").value = data.zonecode;
						document.getElementById("sample6_address").value = addr;
						// 커서를 상세주소 필드로 이동한다.
						document.getElementById("sample6_detailAddress")
								.focus();
					}
				}).open();
	}
</script>

</head>
<body>
	<!-- 헤더들어가는 곳 -->
	<div id="tmn">
	<jsp:include page="../inc/top.jsp" />
	</div>
	<!-- 헤더들어가는 곳 -->
	<!-- 본문내용 -->
	<article>
		<h3 id="hbc" style="text-align: center">회원가입</h3>
		<form action="joinPro.jsp" id="join" name="fr" method="post"
			onsubmit="return joincheck()">
			<fieldset id="jf">
				<table id="ift">
					<tr>
						<td style="width:150px">아이디<span class="s"> * </span></td>
						<td class="i"><input type="text" name="id" class="i"
							placeholder="아이디를 입력하세요."></td>
						<td class="c"><input type="button" value="중복확인" class="dup"
							onclick="dupcheck()" >
							<input type="hidden" name="dupChecked"value="dupChecked"></td>
							
					</tr>
					<tr>
						<td colspan="3"><small><span style="text-align: center;">아이디는 4~10자 입니다.</span></small></td>
					</tr>
					<tr>
						<td class="h">비밀번호<span class="s">* </span></td>
						<td class="i"><input type="password" name="pass"
							placeholder="비밀번호 입력해주세요." class="i"></td>
					<tr>
						<td class="h">비밀번호 재확인<span class="s">* </span></td>
						<td class="i"><input type="password" name="pass2"
							placeholder="비밀번호를 다시 입력해주세요."  class="i"></td>
					</tr>
					<tr>
						<td class="h">이름<span class="s">* </span></td>
						<td class="i"><input type="text" name="name" class="i"></td>
					</tr>
					<tr>
						<td class="h">이메일<span class="s">*</span></td>
						<td class="i"><input type="email" name="email"
							placeholder="abc@abc.com" class="i"></td>
					</tr>
					<tr>
						<td class="h">생년월일<span class="s"> *</span></td>
						<td class="i"><input type="text" maxLength="4" minlength="4"
							name="birthYear" value=""
							pattern="^(19[0-8][0-9]|199[0-9]|20[0-1][0-9]||20[2][0-0])$"
							placeholder="yyyy" required class="bc"> <input type="text"
							maxlength="2" minlength="2" name="birthMonth" value=""
							pattern="^(0[1-9]|1[0-2])$" placeholder="mm" required="required" class="bc">
							
						<input type="text" maxlength="2" minlength="2" name="birthDate"
							value="" pattern="^(0[1-9]|1[0-9]|2[0-9]|3[0-1])$"
							placeholder="dd" required="required" class="bc"></td>
					</tr>
					<tr>
						<td class="h">휴대전화 번호</td>
						<td class="i"><input type="text" name="mobile" class="i"></td>
					</tr>
					<tr>
						<td class="h">주소</td>
						<td class="i"><input type="text" id="sample6_postcode"
							name="zipcode" placeholder="우편번호"> <input type="text"
							name="address" id="sample6_address" placeholder="주소"> 
							
						<br> <input type="text" name="addressDetail" id="sample6_detailAddress"
							placeholder="상세주소"> 
						<input type="text" name="address2" id="sample6_extraAddress"
							placeholder="참고항목">
						</td>
						<td class="c"><input type="button" onclick="sample6_execDaumPostcode()"
							value="우편번호 찾기" class="c"></td>
					</tr>
					<tr>
						<td class="h">성별</td>
						<td><input type="radio" name="gender" value="남">남
							<input type="radio" name="gender" value="여">여</td>
					</tr>
					<tr>
						<td class="i"><input type="hidden" name="grade" value="일반회원"></td>
					</tr>
				</table>
				<br>
				<br>
				<div id="buttons">
					<input type="submit" value="가입하기" class="btn"> <input
						type="reset" value="내용지우기" class="btn">
				</div>
			</fieldset>
			<div class="clear"></div>
		</form>
	</article>
	<!-- 본문내용 -->
	<!-- 본문들어가는 곳 -->

	<div class="clear"></div>
	<!-- 푸터들어가는 곳 -->
	<jsp:include page="../inc/bottom.jsp" />
	<!-- 푸터들어가는 곳 -->
</body>
</html>
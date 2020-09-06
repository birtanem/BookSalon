<%@page import="member.MemberDAO"%>
<%@page import="member.MemberBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="../css/default.css" rel="stylesheet" type="text/css">
<link href="../css/subpage.css" rel="stylesheet" type="text/css">
<link
	href="https://fonts.googleapis.com/css?family=Nanum+Gothic|Nanum+Gothic+Coding|Noto+Serif+KR|Caveat+Brush&display=swap"
	rel="stylesheet">
<script
	src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script type="text/javascript">
	function updateCheck() {
		if (document.fr.pass.value == "") {
			alert("비밀번호 입력하세요");
			document.fr.pass.focus();
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
	function info() {
		location.href = "info.jsp";
	}
</script>

</head>
<body>
	<!-- 헤더파일들어가는 곳 -->
	<div id="tmn">
	<jsp:include page="../inc/top.jsp" />
	</div>
	<!-- 헤더파일들어가는 곳 -->
	<div id="ifu">

		<!-- 회원정보수정 결과 들어가는 곳 -->
		<%
			String id = (String) session.getAttribute("id");
			MemberDAO mdao = new MemberDAO();
			MemberBean mb = mdao.getMember(id);
		%>
		<form action="updatePro.jsp" method="post" name="fr"
			onsubmit="return updateCheck()">
			<h3 id="hbc" align="center">　회원정보 수정</h3>
			<fieldset id="jf">
				<table id="ift">
					<tr>
						<td style="width: 150px">아이디</td>
						<td class="i"><input type="text" name="id"
							class="i" value="<%=mb.getId()%>" readonly="readonly"></td>
					</tr>
					<tr>
						<td class="h">변경할 비밀번호</td>
						<td class="i"><input type="password" name="pass"
							placeholder="변경할 비밀번호 입력해주세요." class="i"></td>
					<tr>
						<td class="h">이름</td>
						<td class="i"><input type="text" name="name"
							class="i" value="<%=mb.getName()%>"></td>
					</tr>
					<tr>
						<td class="h">이메일</td>
						<td class="i"><input type="email" name="email"
							value="<%=mb.getEmail()%>" class="i"></td>
					</tr>
					<tr>
						<td class="h">생년월일</td>
						<td class="i"><input type="text" name="birthYear"
							value="<%=mb.getBirthYear()%>" readonly="readonly" class="bc1">
							<input type="text" name="birthMonth"
							value="<%=mb.getBirthMonth()%>" class="bc1" readonly="readonly">

							<input type="text" name="birthDate"
							value="<%=mb.getBirthDate()%>" readonly="readonly" class="bc1"></td>
					</tr>
							<tr><td colspan="3" align="center"><span class="s"><small>생년월일이 변경된 서류를 보내주시면 확인 후 처리 가능합니다.</small></span></td></tr>
					<tr>
						<td class="h">휴대전화 번호</td>
						<td class="i"><input type="text" name="mobile"
							class="i" value="<%=mb.getMobile()%>"></td>
					</tr>
					<tr>
						<td class="h">주소</td>
						<td class="i"><input type="text" name="zipcode" value="<%=mb.getZipcode()%>" class="zip"> 
						<input
							type="text" name="address"
							value="<%=mb.getAddress()%>"class="ad1"> <br> 
							<input
							type="text" name="addressDetail" 
							value="<%=mb.getAddressDetail()%>" class="ad"> 
							<input type="text"
							name="address2" 
							value="<%=mb.getAddress2()%>" class="ad"></td>
						<td class="c"><input type="button"
							onclick="sample6_execDaumPostcode()" value="우편번호 찾기" class="c"></td>
					</tr>
					<tr>
						<td class="h">성별</td>
						<td colspan="2"><input type="radio" name="gender" value="남">남
							<input type="radio" name="gender" value="여">여</td>
					</tr>

					<tr>
						<td>비밀번호 확인</td>
						<td class="i" colspan="2"><input type="password" name="pass"
							placeholder="현재 비밀번호 입력 후 변경" class="i"></td>
					</tr>
				</table>
				<div class="clear"></div>

				<div id="buttons">
					<input type="submit" value="수정" class="btn"> <input
						type="button" value="취소" onclick="info()" class="btn">
				</div>
			</fieldset>
		</form>
	</div>

	<!-- 회원정보수정 결과 들어가는 곳 -->
	<div class="clear"></div>
	<!-- 푸터 들어가는 곳 -->
	<jsp:include page="../inc/bottom.jsp" />
	<!-- 푸터 들어가는 곳 -->
</body>
</html>
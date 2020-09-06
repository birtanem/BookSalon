<%@page import="member.MemberBean"%>
<%@page import="member.MemberDAO"%>
<%@page import="java.sql.Timestamp"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link
	href="https://fonts.googleapis.com/css?family=Nanum+Gothic|Nanum+Gothic+Coding|Noto+Serif+KR|Caveat+Brush&display=swap"
	rel="stylesheet">
<link href="../css/default.css" rel="stylesheet" type="text/css">
<link href="../css/subpage.css" rel="stylesheet" type="text/css">


<script type="text/javascript">
	function update() {
		location.href = "updateForm.jsp";
	}
	function main() {
		location.href = "../main/main.jsp";
	}
</script>
</head>
<body>
	<!-- 헤더파일들어가는 곳 -->
	<jsp:include page="../inc/top.jsp" />
	<!-- 헤더파일들어가는 곳 -->

	<!-- 내정보 조회결과 들어가는 곳 -->
	<%
		String id = (String) session.getAttribute("id");
		Timestamp time = (Timestamp) session.getAttribute("reg_date");

		MemberDAO mdao = new MemberDAO();
		MemberBean mb = mdao.getMember(id);
		if (mb.getId() != null) {
	%>
		<br>
		<br>
		<div id="info">
			<label><span id="loginId"><%=mb.getId()%></span>님의 회원정보 입니다.</label>
			<br> <br>
			<table>
				<tr>
					<td>아이디</td>
					<td><%=mb.getId()%></td>
				</tr>
				<tr>
					<td>이름</td>
					<td><%=mb.getName()%></td>
				</tr>
				<tr>
					<td>이메일</td>
					<td><%=mb.getEmail()%></td>
				</tr>
				<tr>
					<td>생년월일</td>
					<td><%=mb.getBirthYear()%>-<%=mb.getBirthMonth()%>-<%=mb.getBirthDate()%></td>
				</tr>
				<tr>
					<td>휴대전화</td>
					<td><%=mb.getMobile()%></td>
				</tr>
				<tr>
					<td>주소</td>
					<td><%=mb.getZipcode()%> <%=mb.getAddress()%> <%=mb.getAddressDetail()%>
						<%=mb.getAddress2()%></td>
				</tr>
				<tr>
					<td>성별</td>
					<td><%=mb.getGender()%></td>
				</tr>
				<tr>
					<td>가입일</td>
					<td><%=mb.getReg_date()%></td>
				</tr>
				<tr>
					<td>회원등급</td>
					<td><%=mb.getGrade()%></td>
				</tr>
			</table>
			<div class="b_info">
				<div id="sb">
					<br> <input type="button" value="회원정보수정" onclick="update()"
						class="btn1"> <input type="button" value="메인으로이동"
						onclick="main()" class="btn1"><br>
				</div>
				<div id="sub">
					<span> 사이트를 더이상 이용하지 않는다면 <span><a class="lnk"
							href="deleteForm.jsp">회원탈퇴 바로가기</a></span></span>
					
				</div>
			</div>
		</div>
	
	<%
		} else {
			response.sendRedirect("../main/main.jsp");
		}
	%>

	<!-- 내정보 조회결과 들어가는 곳 -->
	<div class="clear"></div>
	<!-- 푸터 들어가는 곳 -->
	<jsp:include page="../inc/bottom.jsp" />
	<!-- 푸터 들어가는 곳 -->

</body>
</html>
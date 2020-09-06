<%@page import="java.sql.Timestamp"%>
<%@page import="member.MemberBean"%>
<%@page import="member.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자 : 회원삭제</title>
<link
	href="https://fonts.googleapis.com/css?family=Nanum+Gothic|Nanum+Gothic+Coding|Noto+Serif+KR|Caveat+Brush&display=swap"
	rel="stylesheet">
<link href="../css/default.css" rel="stylesheet" type="text/css">
<link href="../css/subpage.css" rel="stylesheet" type="text/css">
</head>
<body>
<!-- 헤더파일들어가는 곳 -->
	<div id="tmn">
	<jsp:include page="../inc/top.jsp" />
	</div>
	<!-- 헤더파일들어가는 곳 -->
	<%

		String id = request.getParameter("memberid");

		MemberDAO mdao = new MemberDAO();
		MemberBean mb = mdao.getMember(id);
		System.out.println("formid" + id);
	%>
	<article id="info">
	<div align="center">
		
				<h3><span id="loginId"><%=mb.getId()%></span> 님의 회원정보 입니다.</h3>
		
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
	<br>
	<br>
	<h3>해당 회원을 탈퇴처리하고 정보를 삭제합니다.</h3>
	
	<input type="button" value="확인" onclick="location.href='memberDeletePro.jsp?memberid=<%=mb.getId()%>'"
	class="btn5">
	<input type="button" value="취소"
		onclick="location.href='memberList.jsp'" class="btn5">
		</div>
		</article>
</body>
</html>
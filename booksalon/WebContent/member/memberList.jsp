<%@page import="member.MemberBean"%>
<%@page import="java.util.List"%>
<%@page import="member.MemberDAO"%>
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
<link href="../css/front.css" rel="stylesheet" type="text/css">
<%
			String id = (String) session.getAttribute("id");
			if (id == null) {
				response.sendRedirect("login.jsp");
			} else {
				if (!id.equals("admin")) {
					response.sendRedirect("login.jsp");
				}
			}
			MemberDAO mdao = new MemberDAO();
			MemberBean mb = new MemberBean();
			List memberList = mdao.getMemberList();

			request.setAttribute("memberList", memberList);
		%>
<script type="text/javascript">
	function changeGrade(id, grade) {
		location.href = "memberUpdatePro.jsp?id=" + id + "&grade=" + grade;
	}
</script>

</head>
<body>
		<!-- 헤더파일들어가는 곳 -->
		<jsp:include page="../inc/top.jsp" />
		<!-- 헤더파일들어가는 곳 -->
		
	<div id="ml">

		<div>
			<form name="fr" method="post">
				<table>
					<tr class="ttitle">
						<th class="">아이디</th>
						<th class="ttname">이름</th>
						<th>이메일</th>
						<th>생년월일</th>
						<th>주소</th>
						<th>성별</th>
						<th>가입일</th>
						<th>회원등급</th>
						<th>관리</th>
					</tr>
					<%
						for (int i = 0; i < memberList.size(); i++) {
							mb = (MemberBean) memberList.get(i);
					%>

					<tr>
						<td><%=mb.getId()%></td>
						<td><%=mb.getName()%></td>
						<td><%=mb.getEmail()%></td>
						<td><%=mb.getBirthYear()%>/<%=mb.getBirthMonth()%>/<%=mb.getBirthDate()%></td>
						<td><%=mb.getZipcode()%> <%=mb.getAddress()%> <%=mb.getAddress2()%>
							<%=mb.getAddressDetail()%></td>
						<td><%=mb.getGender()%></td>
						<td><%=mb.getReg_date()%></td>
						<td><select name="grade"
							onchange="changeGrade('<%=mb.getId()%>',this.value);">
								<option selected="selected"><%=mb.getGrade()%></option>
								<option value="일반회원">일반회원</option>
								<option value="열심회원">열심회원</option>
								<option value="우수회원">우수회원</option>
								<option value="관리자">관리자</option>
						</select></td>
						<%
							if (mb.getId().equals("admin")) {
						%>
						<td></td>
					</tr>
					<%
						} else {
					%>
					<td><input type="button" value="삭제" onclick="location.href='memberDelete.jsp?memberid=<%=mb.getId()%>'"></td>
					</tr>
					<%
						}
						}
					%>
				</table>
			</form>
		</div>

	</div>

		<!-- 메인 콘텐츠 들어가는 곳 -->
		<div class="clear"></div>
		<!-- 푸터 들어가는 곳 -->
		<jsp:include page="../inc/bottom.jsp" />
		<!-- 푸터 들어가는 곳 -->
</body>
</html>
<%@page import="member.MemberDAO"%>
<%@page import="member.MemberBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
request.setCharacterEncoding("utf-8");

String id=request.getParameter("id");
String pass=request.getParameter("pass");

MemberDAO mdao=new MemberDAO();
int check=mdao.userCheck(id, pass);
if(check==1){
	mdao.deleteMember(id); %>	
	<script type="text/javascript">
	alert("탈퇴처리 되었습니다.");
	</script>
<% session.invalidate();
	response.sendRedirect("../main/main.jsp");
}else if(check==0){%>
<script type="text/javascript">
alert("비밀번호를 다시 확인해주세요")</script>
<%}else{ %>
<script type="text/javascript">
alert("존재하지않는 아이디입니다.");
history.back();</script>
<%} %>

</body>
</html>
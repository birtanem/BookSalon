<%@page import="member.MemberDAO"%>
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
String admin=(String)session.getAttribute("id");

if(admin==null&&!admin.equals("admin")){
	response.sendRedirect("info.jsp");
}

String id=request.getParameter("memberid");
MemberDAO mdao=new MemberDAO();
 mdao.deleteMember(id);

 response.sendRedirect("memberList.jsp");

%>
</body>
</html>
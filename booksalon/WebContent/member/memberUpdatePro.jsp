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
String grade=request.getParameter("grade");
// String admin=(String)session.getAttribute("id");
String id=request.getParameter("id");
//String[] id=request.getParameterValues("name");

if(id==null&&!id.equals("admin")){
	response.sendRedirect("info.jsp");
	return;
}


// MemberBean mb=new MemberBean ();
// mb.setGrade(grade);
// mb.setId(id);

	
MemberDAO mdao=new MemberDAO();
// mdao.getMember(id);
mdao.updateMemberList(id, grade);


response.sendRedirect("memberList.jsp");

%>


</body>
</html>
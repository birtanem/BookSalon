<%@page import="board.boardDAO"%>
<%@page import="board.boardBean"%>
<%@page import="java.sql.Timestamp"%>
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
String sub=request.getParameter("subject");
String cont=request.getParameter("content");
Timestamp date=new Timestamp(System.currentTimeMillis());
String id=request.getParameter("id");
String pass=request.getParameter("pass");

	boardBean bb=new boardBean();
	bb.setId(id);
	bb.setSubject(sub);
	bb.setContent(cont);
	bb.setDate(date);
	bb.setPass(pass);
	

	boardDAO bdao=new boardDAO();
	bdao.insertBoard(bb);
	
	response.sendRedirect("s_list.jsp");

%>
</body>
</html>


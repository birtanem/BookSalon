<%@page import="board.g_boardDAO"%>
<%@page import="board.boardBean"%>
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
int num=Integer.parseInt(request.getParameter("num"));
String id=(String)session.getAttribute("id");
String subject=request.getParameter("subject");
String content=request.getParameter("content");
String file=request.getParameter("file");
boardBean bb= new boardBean();
bb.setNum(num);
bb.setId(id);
bb.setSubject(subject);
bb.setContent(content);
bb.setFile(file);

g_boardDAO bdao=new g_boardDAO();

if(id!=null && id.equals("admin")){
	bdao.updatecontent(bb);
	response.sendRedirect("g_list.jsp");
}else{%>
<script type="text/javascript">
history.back();</script>
<%} %>
</body>
</html>
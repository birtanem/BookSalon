<%@page import="board.boardDAO"%>
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
String id=(String)session.getAttribute("id");
String pass=request.getParameter("pass");
int num=Integer.parseInt(request.getParameter("num"));

boardBean bb=new boardBean();
bb.setNum(num);
bb.setId(id);
bb.setPass(pass);
boardDAO bdao=new boardDAO();
int check=bdao.check(id, pass);

if(check==1 || id.equals("admin")){
	bdao.deleteContent(bb);
	response.sendRedirect("s_list.jsp");
}else if(check==0){%>
	<script type="text/javascript">
	alert("비밀번호가 일치하지 않습니다.");
	history.back();</script>
<%}else{ %>
	<script type="text/javascript">
	history.back();</script>
<%} %>


</body>
</html>
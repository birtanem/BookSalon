<%@page import="board.g_boardDAO"%>
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
int num=Integer.parseInt(request.getParameter("num"));

boardBean bb=new boardBean();
bb.setNum(num);
bb.setId(id);
g_boardDAO bdao=new g_boardDAO();

if(id!=null && id.equals("admin")){
	bdao.deleteContent(bb);
	%>
	<script type="text/javascript">
alert("해당글이 삭제되었습니다.");
location.href="g_list.jsp";
</script>
<%}else{ %>
	<script type="text/javascript">
	history.back();</script>
<%} %>


</body>
</html>
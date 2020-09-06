<%@page import="board.boardDAO"%>
<%@page import="board.w_boardDAO"%>
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
<%int num = Integer.parseInt(request.getParameter("num")); 
String id=(String)session.getAttribute("id");
String pass=(String)session.getAttribute("pass");
boardBean bb=new boardBean();
bb.setNum(num);
bb.setId(id);
bb.setPass(pass);
w_boardDAO wbdao=new w_boardDAO();
boardDAO bdao =new boardDAO();
int check=bdao.check(id, pass);

if(check==1){
	wbdao.deleteContent(bb);%>
	<script type="text/javascript">window.close("handWrite.jsp");</script>
<!-- <h4 align="center">해당글이 삭제되었습니다.<br><input type</h4> -->
<%}else if(check==0){%>
	<script type="text/javascript">
	alert("비밀번호가 일치하지 않습니다.");
	history.back();</script>
<%}else{ %>
	<script type="text/javascript">
	history.back();</script>
<%} %>

</body>
</html>
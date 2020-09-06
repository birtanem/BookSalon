<%@page import="board.boardBean"%>
<%@page import="board.boardDAO"%>
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
String id=request.getParameter("id");
String pass=request.getParameter("pass");
String subject=request.getParameter("subject");
String content=request.getParameter("content");
boardBean bb= new boardBean();
bb.setNum(num);
bb.setId(id);
bb.setPass(pass);
bb.setSubject(subject);
bb.setContent(content);

boardDAO bdao=new boardDAO();
int check=bdao.check(id, pass);

if(check==1){
	bdao.updatecontent(bb);
	response.sendRedirect("s_list.jsp");
}else if(check==0){
%><script type="text/javascript">
alert("비밀번호가 일치하지 않습니다.");
history.back();</script>
<%}else{%>
<script type="text/javascript">
alert("글쓰기는 회원만 가능합니다.");
history.back();</script>
<%} %>
</body>
</html>
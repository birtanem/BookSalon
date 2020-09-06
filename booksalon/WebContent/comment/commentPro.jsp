<%@page import="java.sql.Timestamp"%>
<%@page import="board.commentDAO"%>
<%@page import="board.commentBean"%>
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
String writer=(String)session.getAttribute("id");
String content=request.getParameter("comment");
int bnum=Integer.parseInt(request.getParameter("num"));
Timestamp regdate=new Timestamp(System.currentTimeMillis());
if(writer!=null){
	commentBean cb=new commentBean();
	cb.setContent(content);
	cb.setBnum(bnum);
	cb.setWriter(writer);
	cb.setRegdate(regdate);
	commentDAO cdao=new commentDAO();
	cdao.insertComment(cb);%>
	
	<script type="text/javascript">
	location.href="../b_sentence/s_content.jsp?num=<%=bnum%>";
	</script>	
<%}else{%>
<script type="text/javascript">alert("댓글은 회원만 달 수 있습니다.");
location.href="../member/login.jsp";</script>
<%} %>
</body>
</html>
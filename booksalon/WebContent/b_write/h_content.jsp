<%@page import="java.text.SimpleDateFormat"%>
<%@page import="sun.java2d.pipe.SpanShapeRenderer.Simple"%>
<%@page import="board.w_boardDAO"%>
<%@page import="board.boardBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="../css/default.css" rel="stylesheet" type="text/css">

</head>
<body>


<%
request.setCharacterEncoding("utf-8");
String id =(String)session.getAttribute("id");
String subject=request.getParameter("subject");
String content=request.getParameter("content");
int num = Integer.parseInt(request.getParameter("num"));

boardBean bb= new boardBean();
w_boardDAO bdao = new w_boardDAO();
bdao.readcount(num);
bb=bdao.getcontent(num);

SimpleDateFormat sdf= new SimpleDateFormat("yyyy-MM-dd");
%>	

<div class="hcontent" align="center">
<h3><%=bb.getSubject() %></h3>
<img src="../upload/<%=bb.getFile() %>" width="700" height="600">
<br>
<br>
<pre><%=bb.getContent() %></pre>
<br>

<p>작성자 : <%=bb.getId() %></p>
<p>작성일 : <%=sdf.format(bb.getDate()) %></p>
<p>조회수 : <%=bb.getReadcount()%></p>
<br>
<%if(id!=null){if(id. equals(bb.getId())) {%>
					<input type="button" name="update" class="btn4" value="글수정"
						onclick="location.href='h_update.jsp?num=<%=bb.getNum()%>&orifile=<%=bb.getFile()%>'">
					<input type="button" name="delete" class="btn4" value="글삭제"
						onclick="location.href='h_delete.jsp?num=<%=bb.getNum()%>'">
					<%
						}else if(id. equals("admin")){
					%><input type="button" name="delete" class="btn4" value="글삭제"
						onclick="location.href='h_delete.jsp?num=<%=bb.getNum()%>'">
					<%} }%>
<input type="button" class="btn4" name="back" value="창닫기" onclick="window.close()">
</div>



</body>
</html>
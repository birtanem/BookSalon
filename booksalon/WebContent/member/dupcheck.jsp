<%@page import="member.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
function ok(){
	opener.document.fr.id.value=document.dcfr.id.value;
	opener.document.fr.dupChecked.value="dupCheck";
	window.close();
}</script>
</head>
<body>
<div align="center">
<br>
<br>
<%
String id=request.getParameter("id");


MemberDAO mdao=new MemberDAO();

int dcheck=mdao.dupcheck(id);
if(dcheck==-1){
	%><h4 style="text-align:center"><%=id %>는 사용할 수 있습니다.</h4>
	<input type="button" value="아이디사용" onclick="ok()"><%
}else{%> 
<h4>사용할 수 없는 아이디 입니다.</h4>
<%} 
%>
<form action="dupcheck.jsp" method="post" name="dcfr">
아이디 : <input type="text" name="id" value="<%=id%>">
<input type="submit" value="아이디찾기">
</form>
</div>
</body>
</html>
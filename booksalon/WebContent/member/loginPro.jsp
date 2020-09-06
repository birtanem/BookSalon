<%@page import="member.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<!-- member/loginPro.jsp -->
<%
String id=request.getParameter("id");
String pass=request.getParameter("pass");
//memberDAO int 리턴 userCheck(id,pass)만들기
//memberDAO mdao객체생성
MemberDAO mdao=new MemberDAO();
//int check = userCheck(id,pass)메서드 호출
int check=mdao.userCheck(id, pass);
//check==1 세션값생성"id",id   - main.jsp로 이동
//check==0 "비밀번호틀림" 뒤로이동
//check==-1 "아이디없음" 뒤로이동
if(check==1){
	session.setAttribute("id", id);
	session.setAttribute("pass", pass);
	response.sendRedirect("../main/main.jsp");
}else if(check==0){
	%><script type="text/javascript">alert("비밀번호가 일치하지 않습니다.");
	 history.back();</script>
<%}else{%>
<script type="text/javascript">alert("아이디가 존재하지 않습니다.");
history.back();</script>
<% }%>


</body>
</html>
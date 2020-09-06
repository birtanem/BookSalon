<%@page import="board.boardDAO"%>
<%@page import="board.w_boardDAO"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
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
String uploadPath=request.getRealPath("/upload");
System.out.println(uploadPath);
int maxSize=5*1024*1024;
MultipartRequest multi=new MultipartRequest(request,uploadPath,maxSize,"utf-8",new DefaultFileRenamePolicy());

int num=Integer.parseInt(multi.getParameter("num"));

String id=multi.getParameter("id");
String pass=multi.getParameter("pass");

String subject=multi.getParameter("subject");
String content=multi.getParameter("content");
String file=multi.getFilesystemName("file");
String orifile=multi.getParameter("orifile");



System.out.println(file);

boardBean bb= new boardBean();
bb.setNum(num);
bb.setId(id);
bb.setPass(pass);
bb.setSubject(subject);
bb.setContent(content);
if(file==null||file==""){
	bb.setFile(orifile);
}else{
bb.setFile(file);}



boardDAO bdao=new boardDAO();
w_boardDAO wbdao=new w_boardDAO();
int check = bdao.check(id, pass);
if(check==1){wbdao.updatecontent(bb);
response.sendRedirect("h_content.jsp?num="+bb.getNum());
}else if(check==0){
%><script type="text/javascript">
alert("비밀번호가 일치하지 않습니다.");
history.back();</script>
<%}else{%>
<script type="text/javascript">
alert("회원만 가능합니다.");
history.back();</script>
<%} %>
</body>
</html>
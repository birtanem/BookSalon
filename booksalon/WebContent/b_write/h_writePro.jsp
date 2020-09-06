<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="board.w_boardDAO"%>
<%@page import="board.boardBean"%>
<%@page import="java.sql.Timestamp"%>
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

String subject=multi.getParameter("subject");
String content=multi.getParameter("content");
String file=multi.getFilesystemName("file");
Timestamp date=new Timestamp(System.currentTimeMillis());
String id=multi.getParameter("id");
String pass=multi.getParameter("pass");




	boardBean bb=new boardBean();
	bb.setId(id);
	bb.setSubject(subject);
	bb.setDate(date);
	bb.setPass(pass);
	bb.setFile(file);
	bb.setContent(content);
	

	w_boardDAO bdao=new w_boardDAO();
	bdao.insertBoard(bb);
	
	response.sendRedirect("handWrite.jsp");

%>
</body>
</html>
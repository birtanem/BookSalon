<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@page import="board.g_boardDAO"%>
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

String sub=multi.getParameter("subject");
String cont=multi.getParameter("content");
Timestamp date=new Timestamp(System.currentTimeMillis());
String id=multi.getParameter("id");
String pass=multi.getParameter("pass");
String file=multi.getFilesystemName("file");




	boardBean bb=new boardBean();
	bb.setId(id);
	bb.setSubject(sub);
	bb.setContent(cont);
	bb.setDate(date);
	bb.setPass(pass);
	bb.setFile(file);
	

	g_boardDAO bdao=new g_boardDAO();
	bdao.insertBoard(bb);
	
	response.sendRedirect("g_list.jsp");

%>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="https://fonts.googleapis.com/css?family=Nanum+Gothic|Nanum+Gothic+Coding|Noto+Serif+KR|Caveat+Brush&display=swap" rel="stylesheet">
<link href="../css/default.css" rel="stylesheet" type="text/css">
<link href="../css/subpage.css" rel="stylesheet" type="text/css">
</head>
<body>
	<%
		String id = (String) session.getAttribute("id");
		String pass = (String) session.getAttribute("pass");
	%>

		<!-- 헤더파일들어가는 곳 -->
	<div id="tmn">
	<jsp:include page="../inc/top.jsp" />
	</div>
	<!-- 헤더파일들어가는 곳 -->
	<div id="wrap">
		<div class="content-section">
		<form action="g_writePro.jsp" method="post"
			enctype="multipart/form-data">
			<input type="hidden" name="id" value="<%=id%>">
			<input type="hidden" name="pass" value="<%=pass%>">
			
			<table style="width: 600px">
			<tr><td>제목</td><td><input name="subject" type="text"
					style="width: 100%;"></td></tr>
			<tr><td>내용</td><td><textarea style="width: 100%;" rows="10" name="content"
					id="textAreaContent" cols="80"></textarea></td></tr>
			<tr><td></td><td><input type="file" name="file"></td></tr>
			<tr><td><input type="submit" name="write" class="btn" value="글쓰기"><input type="button" name="back" class="btn" value="취소"
					onclick="location.href='g_list.jsp'"></td></tr>
			</table>
		</form>
		</div>
		<div class="clear"></div>
		<!-- 푸터들어가는 곳 -->
		<jsp:include page="../inc/bottom.jsp" />
		<!-- 푸터들어가는 곳 -->
	</div>

</body>
</html>
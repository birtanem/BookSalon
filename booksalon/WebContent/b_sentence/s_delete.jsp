<%@page import="java.text.SimpleDateFormat"%>
<%@page import="board.boardBean"%>
<%@page import="board.boardDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link
	href="https://fonts.googleapis.com/css?family=Nanum+Gothic|Nanum+Gothic+Coding|Noto+Serif+KR|Caveat+Brush&display=swap"
	rel="stylesheet">
<link href="../css/default.css" rel="stylesheet" type="text/css">
<link href="../css/front.css" rel="stylesheet" type="text/css">
</head>
<body>
	<!-- 헤더파일들어가는 곳 -->
	<div id="tmn">
	<jsp:include page="../inc/top.jsp" />
	</div>
	<!-- 헤더파일들어가는 곳 -->
	
	
	<div id="sdd">

		<!-- 게시글삭제 들어가는 곳 -->
		<%
			int num = Integer.parseInt(request.getParameter("num"));

			boardDAO bdao = new boardDAO();
			boardBean bb = bdao.getcontent(num);

			String id = request.getParameter("id");
			String pass = request.getParameter("pass");
			SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd");
		%>
		<div align="center" class="sd">
			<form action="s_deletePro.jsp?num=<%=bb.getNum()%>" method="post">
				<input type="hidden" name="id" value="<%=bb.getId()%>"> 
				<br>
					<label><h4>삭제된	글은 복구되지 않습니다.</h4></label>
					<br>
				<table border="1" class="sdt">
					<tr>
						<td class="std">  <%=bb.getNum()%></td>
						<td class="std">  제목  </td>
						<td colspan="2" class="std3"><%=bb.getSubject()%></td>
					</tr>
					<tr>
						<td class="std">  작성자 </td>
						<td class="std3"><%=bb.getId()%></td>
						<td >작성일</td>
						<td class="std3"><%=sdf.format(bb.getDate())%></td>
					</tr>
					<tr>
						<td colspan="4" class="std2" ><pre><%=bb.getContent()%></pre></td>
					</tr>
					<tr>
						<td colspan="1" class="std">  비밀번호 확인 :</td>
						<td colspan="3" class="std3" ><input type="password" name="pass"></td>
					</tr>
					<tr>
						<td colspan="4" class="std3"><input type="submit" name="update"
							class="btn" value="삭제"> <input type="button" name="list"
							class="btn" value="취소" onclick="location.href='s_list.jsp'"></td>
					</tr>
				</table>
			</form>
		</div>

		<!--게시글삭제 들어가는 곳 -->
	</div>
	<div class="clear"></div>
	<!-- 푸터 들어가는 곳 -->
	<jsp:include page="../inc/bottom.jsp" />
	<!-- 푸터 들어가는 곳 -->
</body>
</html>
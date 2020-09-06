<%@page import="java.text.SimpleDateFormat"%>
<%@page import="board.boardBean"%>
<%@page import="board.g_boardDAO"%>
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
<link href="../css/subpage.css" rel="stylesheet" type="text/css">


</head>
<body>
	<!-- 헤더파일들어가는 곳 -->
	<div id="tmn">
	<jsp:include page="../inc/top.jsp" />
	</div>
	<!-- 헤더파일들어가는 곳 -->
	<article>
		<!-- 본문들어가는 곳 -->
		<%
			int num = Integer.parseInt(request.getParameter("num"));

			g_boardDAO bdao = new g_boardDAO();
			bdao.readcount(num);

			boardBean bb = bdao.getcontent(num);
			String id = (String) session.getAttribute("id");
			String pass = (String) session.getAttribute("pass");

			String file = request.getParameter("file");
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		%>
		<div class="clear"></div>
		<div id="gc">
			<table>
				<tr>
					<td><%=bb.getNum()%></td>
					<td><%=bb.getSubject()%></td>
					<td>조회수</td>
					<td><%=bb.getReadcount()%></td>
				</tr>
				<tr>
					<td>작성자</td>
					<td><%=bb.getId()%></td>
					<td>작성일</td>
					<td><%=sdf.format(bb.getDate())%></td>
				</tr>
				<tr>
					<td>첨부파일</td>
					<td colspan="3"><a
						href="filedown.jsp?file_name=<%=bb.getFile()%>"><%=bb.getFile()%></a></td>
				</tr>
				<tr>
					<td>
					<td colspan="3" height="100"><%=bb.getContent()%></td>
				</tr>
				<tr>
					<%
						if (id != null && id.equals("admin")) {
					%>
					<td><input type="button" name="update" class="btn" value="글수정"
						onclick="location.href='g_update.jsp?num=<%=bb.getNum()%>'"></td>
					<td><input type="button" name="delete" class="btn" value="글삭제"
						onclick="location.href='g_delete.jsp?num=<%=bb.getNum()%>'"></td>

					<%
						}
					%>
					<td><input type="button" name="list" class="btn" value="글목록"
						onclick="location.href='g_list.jsp'"></td>
				</tr>
			</table>
		</div>
	</article>


	<div class="clear"></div>
	<!-- 푸터들어가는 곳 -->
	<jsp:include page="../inc/bottom.jsp" />
	<!-- 푸터들어가는 곳 -->
</body>
</html>
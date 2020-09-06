<%@page import="java.text.SimpleDateFormat"%>
<%@page import="board.g_boardDAO"%>
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
<link href="../css/subpage.css" rel="stylesheet" type="text/css">
</head>
<body>
	<!-- 헤더파일들어가는 곳 -->
	<div id="tmn">
	<jsp:include page="../inc/top.jsp" />
	</div>
	<!-- 헤더파일들어가는 곳 -->

	<div id="gu">
		<!-- 게시판 -->

		<%
			int num = Integer.parseInt(request.getParameter("num"));

			g_boardDAO bdao = new g_boardDAO();
			boardBean bb = bdao.getcontent(num);

			String id = (String) session.getAttribute("id");
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		%>
		<div id="gu1" align="center">
			<form action="g_updatePro.jsp?num=<%=bb.getNum()%>" method="post">

				<table border="1" class="gut">
					<tr>
						<td class="gut1"><%=bb.getNum()%></td>
						<td class="gut1">제목</td>
						<td colspan="2" class="gut2"><input type="text" name=subject
							value="<%=bb.getSubject()%>"></td>
					</tr>
					<tr>
						<td class="gut1">작성자</td>
						<td class="gut1"><%=bb.getId()%></td>
						<td class="gut1">작성일</td>
						<td class="gut1"><%=sdf.format(bb.getDate())%></td>
					</tr>
					<tr>
						<td colspan="4"><textarea cols="50" rows="10" name="content"><%=bb.getContent()%></textarea></td>
					</tr>
					<tr>
						<td class="gut1">첨부파일</td>
						<td colspan="3"><input type="file" name="file"></td>
					</tr>
					<tr>
						<td colspan="4" class="gut1"><input type="submit" name="update" class="btn3" value="수정">
						<input type="button" name="content" class="btn3"
							value="취소"
							onclick="location.href='g_content.jsp?num=<%=bb.getNum()%>'"></td>
					</tr>
				</table>
			</form>
		</div>

		<!-- 게시판 -->

	</div>
	<div class="clear"></div>
	<!-- 푸터들어가는 곳 -->
	<jsp:include page="../inc/bottom.jsp" />
	<!-- 푸터들어가는 곳 -->
</body>
</html>
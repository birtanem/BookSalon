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
<link href="../css/subpage.css" rel="stylesheet" type="text/css">
</head>
<body>
<!-- 헤더파일들어가는 곳 -->
	<div id="tmn">
	<jsp:include page="../inc/top.jsp" />
	</div>
	<!-- 헤더파일들어가는 곳 -->
	<div id="su">

		<!-- 게시판 -->

		<%
			int num = Integer.parseInt(request.getParameter("num"));

			boardDAO bdao = new boardDAO();
			boardBean bb = bdao.getcontent(num);

			String id = request.getParameter("id");
			String pass = request.getParameter("pass");
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		%>
		<div>
			<form action="s_updatePro.jsp?num=<%=bb.getNum()%>&id=<%=bb.getId() %>" method="post">
				<table border="1">
					<tr>
						<td><%=bb.getNum()%></td>
						<td>제목</td>
						<td colspan="2"><input type="text" name=subject
							value="<%=bb.getSubject()%>"></td>
					</tr>
					<tr>
						<td class="tw">작성자</td>
						<td><%=bb.getId()%></td>
						<td>작성일</td>
						<td><%=sdf.format(bb.getDate())%></td>
					</tr>
					<tr>
						<td colspan="4"><textarea class="ta" cols="80" rows="20"
								name="content"><%=bb.getContent()%></textarea></td>
					</tr>
					<tr>
						<td colspan="2">비밀번호 확인 :</td>
						<td colspan="2"><input type="password" name="pass"></td>
					</tr>
					<tr>
						<td colspan="4"><input type="submit" name="update"
							class="btn" value="수정"> <input type="button" name="list"
							class="btn" value="취소" onclick="location.href='s_list.jsp'"></td>
					</tr>
				</table>
			</form>
		</div>

	</div>
	<!-- 게시판 -->


	<div class="clear"></div>
	<!-- 푸터들어가는 곳 -->
	<jsp:include page="../inc/bottom.jsp" />
	<!-- 푸터들어가는 곳 -->
</body>
</html>
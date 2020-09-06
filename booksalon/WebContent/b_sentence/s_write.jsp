<%@page import="board.boardBean"%>
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
	<!-- 본문들어가는 곳 -->

	<div id="sw">
		<%
			// String id=null;

			// if (session.getAttribute("id") != null) {
			// 	id= (String) session.getAttribute("id");
			// }
			String id = (String) session.getAttribute("id");
			String pass = (String) session.getAttribute("pass");
		%>

		<div class="content-section">
			<form action="s_writePro.jsp" name="fr" method="post">
				<table>
					<input type="hidden" name="id" value="<%=id%>">
					<input type="hidden" name="pass" value="<%=pass%>">
					<div class="form-group">
						<tr>
							<td>제목</td>
							<td><input name="subject" type="text" class="te" ></td>
						</tr>
					</div>
					<div class="form-group">
						<tr>
							<td>내용</td>
							<td><p><textarea  rows="10" name="content"
									id="textAreaContent" cols="80" ></textarea></p></td>
						</tr>
					</div>
					<div class="form-group">
						<tr>
							<td colspan="2"><input type="submit" name="content"
								class="btn" value="글쓰기"> <input type="button"
								name="back" class="btn" value="취소"
								onclick="location.href='s_list.jsp'">
							<td></td>
					</div>
				</table>
			</form>
		</div>



		<!-- 본문들어가는 곳 -->

	</div>

	<div class="clear"></div>
	<!-- 푸터들어가는 곳 -->
	<jsp:include page="../inc/bottom.jsp" />
	<!-- 푸터들어가는 곳 -->
</body>
</html>
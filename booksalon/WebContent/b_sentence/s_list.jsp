<%@page import="java.text.SimpleDateFormat"%>
<%@page import="board.commentDAO"%>
<%@page import="board.commentBean"%>
<%@page import="java.util.List"%>
<%@page import="board.boardDAO"%>
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
	
	
	<div id="wrap">

		<!-- 게시판 -->
		<%
			String id = (String) session.getAttribute("id");
			request.setCharacterEncoding("utf-8");
			boardBean bb = new boardBean();
			boardDAO bdao = new boardDAO();

			int count = bdao.getBoardCount();
			int pageSize = 10;
			String pageNum = request.getParameter("pageNum");
			if (pageNum == null) {
				pageNum = "1";
			}
			int currentPage = Integer.parseInt(pageNum);
			int startRow = currentPage * pageSize - (pageSize - 1);
			int endRow = currentPage * pageSize;

			List boardList = bdao.getBoardList(startRow, pageSize);

			commentDAO cdao = new commentDAO();

			SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		%>

		<article>
			<h1>한문장</h1>
			<div id="slist">
				<table id="tlist">
					<tr id="tt">
						<th class="tno">번호</th>
						<th class="ttitle">제목</th>
						<th class="twrite">작성자</th>
						<th class="tdate">등록일</th>
						<th class="tread">조회수</th>
					</tr>
					<%
						for (int i = 0; i < boardList.size(); i++) {
							bb = (boardBean) boardList.get(i);
					%>
					<tr>
						<td><%=bb.getNum()%></td>
						<td><a id="text" href="s_content.jsp?num=<%=bb.getNum()%>">
								<%=bb.getSubject()%> <small style="color: gray;"><b><%=cdao.getCommentCount(bb.getNum())%></b></small>
						</a></td>
						<td><%=bb.getId()%></td>
						<td><%=sdf.format(bb.getDate())%></td>
						<td><%=bb.getReadcount()%></td>
					</tr>
					<%
						}
					%>
				</table>
				<div id="page_control">
					<%
						int pageCount = (count % pageSize == 0 ? count / pageSize : count / pageSize + 1);
						int pageBlock = 10;
						int startPage = (currentPage - 1) / pageBlock * pageBlock + 1;
						int endPage = startPage + pageBlock - 1;
						if (endPage > pageCount) {
							endPage = pageCount;
						}
						if (startPage > pageBlock) {
					%>
					<a href="s_list.jsp?pageNum=<%=startPage - pageBlock%>">[이전]</a>
					<%
						}
						//1~10 11~20 startPage ~ endPage

						for (int i = startPage; i <= endPage; i++) {
					%>
					<a href="s_list.jsp?pageNum=<%=i%>"> <%=i%>
					</a>
					<%
						}
						//[다음] 10페이지 다음
						if (endPage < pageCount) {
					%>
					<a href="s_list.jsp?pageNum=<%=startPage + pageBlock%>">[다음]</a>
					<%
						}
					%>
				</div>
				<div id="table_search">
							<form action="search.jsp" method="post">
					<%
						if (id != null) {
					%>
					<table id="Stable">
						<tr>
							<td><input type="button" name="글쓰기" value="글쓰기" class="btn1"
								onclick="location.href='s_write.jsp'"></td>
							<%
								}
							%>
							<td><input type="text" name="search" class="input_box"></td>
							<td><input type="submit" value="검색" class="btn"></td>
						</tr>
					</table>
							</form>
				</div>


			</div>

			<div class="clear"></div>

		</article>




		<!-- 게시판 -->
		<!-- 본문들어가는 곳 -->
		<div class="clear"></div>
		<!-- 푸터들어가는 곳 -->
		<jsp:include page="../inc/bottom.jsp" />
		<!-- 푸터들어가는 곳 -->
	</div>
</body>
</html>
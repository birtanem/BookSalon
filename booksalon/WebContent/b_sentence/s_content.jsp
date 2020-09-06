<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.List"%>
<%@page import="board.commentDAO"%>
<%@page import="board.commentBean"%>
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
<link href="vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
<link href="vendor/fontawesome-free/css/all.min.css" rel="stylesheet">
	
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
		<%
			request.setCharacterEncoding("utf-8");
			int num = Integer.parseInt(request.getParameter("num"));

			boardDAO bdao = new boardDAO();
			bdao.readcount(num);

			boardBean bb = bdao.getcontent(num);
			String id = (String) session.getAttribute("id");
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		%>
		<div id="sct" >
			<input type="hidden" name="writer" value="<%=bb.getId()%>"> <input
				type="hidden" name="pass" value="<%=bb.getPass()%>"> <input
				type="hidden" name="num" value="<%=bb.getNum()%>"> <input
				type="hidden" name="subject" value="<%=bb.getSubject()%>"> <input
				type="hidden" name="content" value="<%=bb.getContent()%>"> <input
				type="hidden" name="simpleDate" value="<%=bb.getSimpleDate()%>">
			<div id="sct1" align="center">
			<table id="sTable" border="1">
				<tr>
					<td class="tn"> <%=bb.getNum()%></td>
					<td class="tn" colspan="5"> 제목 : <%=bb.getSubject()%></td>
				</tr>
				<tr>
					<td class="tn"> 작성자</td>
					<td class="tn"> <%=bb.getId()%></td>
					<td class="tn"> 조회수</td>
					<td class="tn"> <%=bb.getReadcount()%></td>
					<td class="tn"> 작성일</td>
					<td class="tn"> <%=sdf.format(bb.getDate())%></td>
					
				</tr>
				<tr>
					<td class="ct" colspan="6" height="100"><pre>　 <%=bb.getContent()%></pre></td>
				</tr>
				<tr>
				<td colspan="6">
				<%if(id!=null){
					if (id.equals(bb.getId())) {
				%>
					<input type="button" name="update" class="btn1" value="글수정"
						onclick="location.href='s_update.jsp?num=<%=bb.getNum()%>'">
					<input type="button" name="delete" class="btn1" value="글삭제"
						onclick="location.href='s_delete.jsp?num=<%=bb.getNum()%>'">
					<%}else if(id.equals("admin")){%>
						<input type="button" name="delete" class="btn1" value="글삭제"
						onclick="location.href='s_delete.jsp?num=<%=bb.getNum()%>'">
					<% } }
					%>
					<input type="button" name="list" class="btn" value="글목록"
						onclick="location.href='s_list.jsp'"></td>
				</tr>
			</table>
			<div>
				<!-- 코멘트 -->
				<%
					commentBean cb = new commentBean();
					commentDAO cdao = new commentDAO();
					int count = cdao.getCommentCount(bb.getNum());

					List commentList = cdao.getCommentList();
				%>
				<table class="comment">
					<%
						for (int i = 0; i < commentList.size(); i++) {
							cb = (commentBean) commentList.get(i);
							if (bb.getNum() == cb.getBnum()) {
					%>
					<tr>
						<td><%=count--%></td>
						<td><%=cb.getWriter()%></td>
						<td><pre><%=cb.getContent()%></pre></td>
						<td><%=sdf.format(cb.getRegdate())%></td>
					</tr>
					<%
						}
						}
					%>
				
				</table>
				<form action="../comment/commentPro.jsp?num=<%=bb.getNum()%>"
					method="post">
					<table class="icomment">
						<tr>
							<td colspan="3"><textarea class="ts" rows="3" cols="75"
									placeholder="댓글쓰기" name="comment"></textarea> <input
								type="submit" value="등록" class="btn"></td>
						</tr>
					</table>
				</form>
			</div>
			</div>
		</div>


		<!-- 본문들어가는 곳 -->
		<div class="clear"></div>
		<!-- 푸터들어가는 곳 -->
		<jsp:include page="../inc/bottom.jsp" />
		<!-- 푸터들어가는 곳 -->
</body>
</html>
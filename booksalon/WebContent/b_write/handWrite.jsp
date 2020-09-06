<%@page import="java.text.SimpleDateFormat"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="board.boardBean"%>
<%@page import="java.util.List"%>
<%@page import="board.w_boardDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <meta name="description" content="">
  <meta name="author" content="">
<meta charset="UTF-8">
<title>Insert title here</title>


<link href="vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
<link href="vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
<link href="https://fonts.googleapis.com/css?family=Nanum+Gothic|Nanum+Gothic+Coding|Noto+Serif+KR|Caveat+Brush&display=swap" rel="stylesheet">
<link href="../css/default.css" rel="stylesheet" type="text/css">
<link href="../css/subpage.css" rel="stylesheet" type="text/css">

</head>
<body>
<!-- 헤더파일들어가는 곳 -->
<div id="tmn">
<jsp:include page="../inc/top.jsp"/>
</div>
<!-- 헤더파일들어가는 곳 -->
<div id="wrap">
<div class="clear"></div>
<%
			String id = (String) session.getAttribute("id");
			request.setCharacterEncoding("utf-8");
			boardBean bb= new boardBean();
			w_boardDAO bdao = new w_boardDAO();
	
			int count = bdao.getBoardCount();
			int pageSize = 12;
			String pageNum = request.getParameter("pageNum");
			if (pageNum == null) {
				pageNum = "1";
			}
			int currentPage = Integer.parseInt(pageNum);
			int startRow = currentPage * pageSize - (pageSize - 1);
			int endRow = currentPage * pageSize;

			List boardList = bdao.getBoardList(startRow, pageSize);
			SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd");
		%>
		
			<div id="hw">
			<h1>필사</h1>
			<div id="gall">
				<%
					for (int i = 0; i < boardList.size(); i++) {
						bb = (boardBean) boardList.get(i);
				%>
				
					
					<img src="../upload/<%=bb.getFile()%>" width="300" height="300" onclick="pop(<%=bb.getNum()%>)">
					
				
				<%
					}
				%>
				</div>
			<div id="table_search">
				<%
					if (id != null) {
				%>
				<a><input type="button" name="글쓰기" value="글쓰기" class="btn3"
					onclick="location.href='h_write.jsp'"></a>
				<%
					}
				%>
		
			</div>
			<script type="text/javascript">
			function pop(num){
				window.open("h_content.jsp?num="+num,"","width=800,height=900,left=300,top=50");
				return;
			}
			</script>
			<div id="page_control">
				<%
					int pageCount = (count % pageSize == 0 ? count / pageSize : count / pageSize + 1);
					int pageBlock = 12;
					int startPage = (currentPage - 1) / pageBlock * pageBlock + 1;
					int endPage = startPage + pageBlock - 1;
					if (endPage > pageCount) {
						endPage = pageCount;
					}
					if (startPage > pageBlock) {
				%>
				<a href="handWrite.jsp?pageNum=<%=startPage - pageBlock%>">[이전]</a>
				<%
					}
					//1~10 11~20 startPage ~ endPage

					for (int i = startPage; i <= endPage; i++) {
				%>
				<a href="handWrite.jsp?pageNum=<%=i%>"> <%=i%>
				</a>
				<%
					}
					//[다음] 10페이지 다음
					if (endPage < pageCount) {
				%>
				<a href="handWrite.jsp?pageNum=<%=startPage + pageBlock%>">[다음]</a>
				<%
					}
				%>
			</div>


			<div class="clear"></div>

		</div>
		
 




		
		

		
<!-- 메인 콘텐츠 들어가는 곳 -->
<div class="clear"></div>
<!-- 푸터 들어가는 곳 -->
<jsp:include page="../inc/bottom.jsp"/>
<!-- 푸터 들어가는 곳 -->
</div>
</body>
</html>
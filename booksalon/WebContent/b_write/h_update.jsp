<%@page import="java.text.SimpleDateFormat"%>
<%@page import="sun.java2d.pipe.SpanShapeRenderer.Simple"%>
<%@page import="board.w_boardDAO"%>
<%@page import="board.boardBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="../css/default.css" rel="stylesheet" type="text/css">
<link href="../css/subpage.css" rel="stylesheet" type="text/css">
<link
	href="https://fonts.googleapis.com/css?family=Nanum+Gothic|Nanum+Gothic+Coding|Noto+Serif+KR|Caveat+Brush&display=swap"
	rel="stylesheet">

<script type="text/javascript">
	function check() {
		if (document.fr.subject.value == "" ){
			alert("제목을 입력해주세요.");
			document.fr.subject.focus();
			return false;
			}
		if (document.fr.subject.value.length>30) {
				alert("제목이 너무 깁니다.");
				document.fr.subject.focus();
				return false;		
		}
		if (document.fr.content.value==""){
			alert("내용을 입력해주세요.");
			document.fr.content.focus();
			return false;		
	}
		if (document.fr.content.value.length>100) {
			alert("내용이 너무 깁니다.");
			document.fr.content.focus();
			return false;
		}
	
		if (document.fr.pass.value == "") {
			alert("비밀번호 확인해주세요.");
			document.fr.pass.focus();
			return false;
		}
		if (document.fr.file.value == null || document.fr.pass.value == "") {
			alert("파일 첨부하세요.");
			document.fr.file.focus();
			return false;
		}
		
	}
</script>

</head>
<body>
	<%
		request.setCharacterEncoding("utf-8");
		String id = (String) session.getAttribute("id");
		String subject = request.getParameter("subject");
		String content = request.getParameter("content");
		int num = Integer.parseInt(request.getParameter("num"));

		boardBean bb = new boardBean();
		w_boardDAO bdao = new w_boardDAO();
		bdao.readcount(num);
		bb = bdao.getcontent(num);

		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
	%>

	<div class="hcontent" align="center">
	<form action="h_updatePro.jsp?num=<%=bb.getNum()%>&orifile=<%=bb.getFile() %>" method="post" name="fr" onsubmit="return check()"
	enctype="multipart/form-data">
	<input type="hidden" name="id" value="<%=bb.getId()%>">
	<input type="hidden" name="orifile" value="<%=bb.getFile()%>"> 
	
		<br> <br> 제목 : <input value="<%=bb.getSubject()%>" name="subject" placeholder="30자이내로 입력해주세요."><br>
		<br> <img src="../upload/<%=bb.getFile()%>" width="700"
			height="600"><br>
		<table>
			<tr>
				<td>내용 :</td>
				<td class="td4"><input value="<%=bb.getContent()%>" name="content" placeholder="100자 이내로 작성해주세요."></td>
			</tr>
			<tr>
				<td>첨부파일 :</td>
				<td class="td4"><input type="file" name="file"></td>
			</tr>
			<tr>
				<td>비밀번호확인 :</td>
				<td class="td4"><input type="password" name ="pass"></td>
			</tr>
		</table>
		<br> <br>
		<%
			if (id != null && id.equals(bb.getId())) {
		%>
		<input type="submit" name="update" class="btn4" value="글수정"
			onclick="check()">
		<input type="button" name="delete" class="btn4" value="글삭제"
			onclick="location.href='h_delete.jsp?num=<%=bb.getNum()%>'">
		<%}	%>
		<input type="button" class="btn4" name="back" value="창닫기"
			onclick="window.close()">
		</form>
	</div>



</body>
</html>
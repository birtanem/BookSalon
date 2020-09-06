<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
<link href="vendor/fontawesome-free/css/all.min.css" rel="stylesheet">
<link href="../css/default.css" rel="stylesheet" type="text/css">
<link href="../css/subpage.css" rel="stylesheet" type="text/css">
<link
	href="https://fonts.googleapis.com/css?family=Nanum+Gothic|Nanum+Gothic+Coding|Noto+Serif+KR|Caveat+Brush&display=swap"
	rel="stylesheet">

<script type="text/javascript">
	function check() {
		if (document.fr.subject.value == null || document.fr.subject.value == "" ){
			alert("제목을 입력해주세요.");
			document.fr.subject.focus();
			return false;
			}
		if (document.fr.subject.value.length>30) {
				alert("제목이 너무 깁니다.");
				document.fr.subject.focus();
				return false;		
		}
		if (document.fr.content.value == null || document.fr.content.value=="") {
			alert("내용을 입력해주세요.");
			document.fr.content.focus();
			return false;		
	}
		if (document.fr.content.value.length>100) {
			alert("내용이 너무 깁니다.");
			document.fr.content.focus();
			return false;
		}
		if (document.fr.file.value == null || document.fr.file.value == "") {
			alert("파일을 첨부하세요.");
			document.fr.file.focus();
			return false;
		}
	}
</script>

</head>
<body>
	<!-- 헤더파일들어가는 곳 -->
	<jsp:include page="../inc/top.jsp" />
	<!-- 헤더파일들어가는 곳 -->
	<div id="hw">
		<!-- 본문들어가는 곳 -->

		<%
			// String id=null;

			// if (session.getAttribute("id") != null) {
			// 	id= (String) session.getAttribute("id");
			// }
			String id = (String) session.getAttribute("id");
			String pass = (String) session.getAttribute("pass");
		%>

		<div class="content-section">
				<form action="h_writePro.jsp" name="fr" method="post"
					enctype="multipart/form-data" onsubmit="return check()">
					<input type="hidden" name="id" value="<%=id%>"> <input
						type="hidden" name="pass" value="<%=pass%>">
					<div class="form-group">
			<table>
						<tr>
							<td class="ctd">제목</td>
							<td class="ctd2"><input name="subject" type="text" placeholder="30자 이내로 적어주세요."></td>
						</tr>
						<tr>
							<td>내용</td>
							<td class="ctd3"><textarea name="content" placeholder="사진에 관한 설명을 100자 이내로 적어주세요."></textarea></td>
						</tr>
						<tr>
							<td>첨부파일</td>
							<td><input type="file" name="file"></td>
						</tr>
						<tr>
							<td colspan="2"><input type="submit" name="write" class="btn"
								value="글쓰기">
							<input type="button" name="back"
								class="btn" value="취소" onclick="location.href='handWrite.jsp'"></td>
						</tr>
			</table>
					</div>
				</form>
		</div>


		<!-- 본문들어가는 곳 -->
		<div class="clear"></div>
		<!-- 푸터들어가는 곳 -->
		<jsp:include page="../inc/bottom.jsp" />
		<!-- 푸터들어가는 곳 -->
	</div>
</body>
</html>

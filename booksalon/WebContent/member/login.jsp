<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="https://fonts.googleapis.com/css?family=Nanum+Gothic|Nanum+Gothic+Coding|Noto+Serif+KR|Caveat+Brush&display=swap" rel="stylesheet">
<link href="../css/default.css" rel="stylesheet" type="text/css">
<link href="../css/subpage.css" rel="stylesheet" type="text/css">

</head>
<body>
	<!-- 헤더파일들어가는 곳 -->
	<div id="tmn">
	<jsp:include page="../inc/top.jsp" />
	</div>
	<!-- 헤더파일들어가는 곳 -->
	<!-- 본문내용 -->
	<div id="lg">
		<form action="loginPro.jsp" id="join" name="fr" method="post">
			<h3 id="hbc" style="text-align: center;">로그인</h3>
			<fieldset class="field">
				<table>
					<tr>
						<td>아이디</td>
						<td><input type="text" name="id"></td>
					</tr>
					<tr>
						<td>비밀번호</td>
						<td><input type="password" name="pass">
					</tr>
				</table>
			</fieldset>
			<div class="clear"></div>
			<div id="buttons">
				<input type="submit" value="로그인" class="btn"> <input
					type="reset" value="취소" class="btn">
			</div>
			<br>
			<div class="lj">
				아직 회원이 아니신가요? <a href="join.jsp">가입하기</a>
			</div>
		</form>
	</div>
	<!-- 본문내용 -->


	<div class="clear"></div>
	<!-- 푸터들어가는 곳 -->
	<jsp:include page="../inc/bottom.jsp" />
	<!-- 푸터들어가는 곳 -->

</body>
</html>
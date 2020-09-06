<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>글삭제</title>
<link
	href="https://fonts.googleapis.com/css?family=Nanum+Gothic|Nanum+Gothic+Coding|Noto+Serif+KR|Caveat+Brush&display=swap"
	rel="stylesheet">
<link href="../css/default.css" rel="stylesheet" type="text/css">
<link href="../css/subpage.css" rel="stylesheet" type="text/css">
<script type="text/javascript">
function check(){
	if(document.fr.pass.value==""){
		alert("비밀번호 확인 해주세요.");
		document.fr.pass.focus();
		return false;
	}
}
</script>
</head>
<body>
<%int num = Integer.parseInt(request.getParameter("num")); %>
<div align="center">
<br>
<br>
<br>
<br>
<h4>해당 글이 모두 삭제됩니다.</h4>
<form action="h_deletePro.jsp?num=<%=num %>" name="fr" method="post" onsubmit="return check()">
<label>비밀번호 확인 : </label><input type="password" name="pass"><br>
<br>
<br>
<br>
<input type="submit" class="btn4" name="submit" value="삭제" class="btn4">
<input type="button" class="btn4" name="back" value="창닫기" class="btn4" onclick="window.close()">
</form>
</div>
</body>
</html>
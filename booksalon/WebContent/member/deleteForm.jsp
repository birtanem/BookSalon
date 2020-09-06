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
<jsp:include page="../inc/top.jsp"/>
<!-- 헤더파일들어가는 곳 -->

<!-- 회원탈퇴안내 들어가는 곳 -->

<%
String id=(String)session.getAttribute("id");
%>
<div id="de">
 <div>
 <br>
 <br>
  <h2>탈퇴안내</h2>
  <span>회원탈퇴를 신청하기 전에 안내 사항을 꼭 확인해주세요.</span>
  <p>
   <span>탈퇴 후 회원정보 및 개인형 서비스 이용기록은 모두 삭제됩니다.</span><br>
   <span>탈퇴 후에도 게시판형 서비스에 등록한 게시물은 그대로 남아 있습니다.</span>
  </p>
 </div>
 <div >
  <form action="deletePro.jsp" name=fr method="post">
  	<table>
   <tr><td>아이디</td>
   <td><input type="text" name="id" value="<%= id %>" readonly></td><tr>
   <tr><td>비밀번호확인</td>
   <td><input type="password" name="pass" required="required"></td></tr>
   </table>
   <br>
   <input type="checkbox" name="agcheck" required="required"><strong>안내 사항을 모두 확인하였으며, 이에 동의합니다.</strong><br>
   <input type="submit" class="btn2" value="회원탈퇴"><br>
   <br>
   <br>
   <br>
   <span>회원탈퇴를 취소하고  </span><a href="info.jsp">회원정보로 돌아가기</a>
  </form>
 </div>
 <!-- 회원탈퇴안내 들어가는 곳 -->
</div>

<div class="clear"></div>
<!-- 푸터 들어가는 곳 -->
<jsp:include page="../inc/bottom.jsp"/>
<!-- 푸터 들어가는 곳 -->
</body>
</html>
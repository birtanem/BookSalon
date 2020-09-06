<%@page import="member.MemberDAO"%>
<%@page import="member.MemberBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
request.setCharacterEncoding("utf-8");
String id=request.getParameter("id");
String pass=request.getParameter("pass");
String pass2=request.getParameter("pass2");
String name=request.getParameter("name");
String email=request.getParameter("email");
String mobile=request.getParameter("mobile");
String zipcode=request.getParameter("zipcode");
String address=request.getParameter("address");
String address2=request.getParameter("address2");
String addressDetail=request.getParameter("addressDetail");
String gender=request.getParameter("gender");

MemberBean mb=new MemberBean();
mb.setId(id);
mb.setPass(pass);
mb.setPass2(pass2);
mb.setName(name);
mb.setEmail(email);
mb.setMobile(mobile);
mb.setZipcode(zipcode);
mb.setAddress(address);
mb.setAddressDetail(addressDetail);
mb.setAddress2(address2);
mb.setGender(gender);

MemberDAO mdao=new MemberDAO();
int check=mdao.userCheck(id, pass);
if(check==1){
	mdao.updateMember(mb);
	response.sendRedirect("info.jsp");
}else if(check==0){%>
	<script type="text/javascript">
	alert("비밀번호를 다시 확인해주세요.");
	history.back();</script>
<%}else {%>
	<script type="text/javascript">
	alert("존재하지 않는 아이디입니다.");
	history.back();
	</script>
<%  }%>

</body>
</html>
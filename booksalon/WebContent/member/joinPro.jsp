<%@page import="java.sql.Timestamp"%>
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
//request한글처리
//request저장된 파라미터 값 가져와서 => 변수에 저장
request.setCharacterEncoding("utf-8");
String id=request.getParameter("id");
String pass=request.getParameter("pass");
String name=request.getParameter("name");
String email=request.getParameter("email");
String birthYear=request.getParameter("birthYear");
String birthMonth=request.getParameter("birthMonth");
String birthDate=request.getParameter("birthDate");
String mobile=request.getParameter("mobile");
String zipcode=request.getParameter("zipcode");
String address=request.getParameter("address");
String addressDetail=request.getParameter("addressDetail");
String address2=request.getParameter("address2");
String gender=request.getParameter("gender");
Timestamp reg_date= new Timestamp(System.currentTimeMillis());
String grade=request.getParameter("grade");

//패키지member 파일이름 MemberBean
//파라미터값을 저장하는 변수 만들고 set,get메서드 만들기

//MemberBean mb객체생성=> 기억장소만들기
//mb에 <= 파라미터값 저장
MemberBean mb=new MemberBean();
mb.setId(id);
mb.setPass(pass);
mb.setName(name);
mb.setEmail(email);
mb.setBirthYear(birthYear);
mb.setBirthMonth(birthMonth);
mb.setBirthDate(birthDate);
mb.setMobile(mobile);
mb.setZipcode(zipcode);
mb.setAddress(address);
mb.setAddressDetail(addressDetail);
mb.setAddress2(address2);
mb.setGender(gender);
mb.setReg_date(reg_date);
mb.setGrade(grade);

//패키지member파일이름 MemberDAO 리턴값 없음 insertMember(자바빈) 메서드 만들기
//MemberDAO mdao객체생성
//insertMember()메서드 호출
MemberDAO mdao=new MemberDAO();
mdao.insertMember(mb);
//"회원가입성공" login.jsp이동
%>
<script type="text/javascript">
location.href="mailSend.jsp?receiver=<%=email%>";</script>
</body>
<!-- member/joinPro.jsp -->
</html>
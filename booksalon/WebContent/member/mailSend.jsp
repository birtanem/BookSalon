<%@page import="mailtest.GoogleAuthentication"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ page import="javax.activation.*"%>
<%@ page import="java.util.*"%>
<%@ page import="javax.mail.*"%>
<%@ page import="javax.mail.internet.*"%>

<%
	request.setCharacterEncoding("UTF-8");
	String sender = "book@salon.com";
	String receiver = request.getParameter("receiver");
	String subject = "회원가입 되었습니다.";
	String content = "북쌀롱 회원이 되셨습니다.<br> 감사합니다 :)♥ ";

	try {
		Properties properties = System.getProperties();
		properties.put("mail.smtp.starttls.enable", "true"); // gmail은 무조건 true 고정
		properties.put("mail.smtp.host", "smtp.gmail.com"); // smtp 서버 주소
		properties.put("mail.smtp.auth", "true"); // gmail은 무조건 true 고정
		properties.put("mail.smtp.port", "587"); // gmail 포트
		Authenticator auth = (Authenticator) new GoogleAuthentication();
		Session s = Session.getDefaultInstance(properties, auth);
		//Session s = Session.getdefultInstance(properties, auth);
		Message message = new MimeMessage(s);
		Address sender_address = new InternetAddress(sender);
		Address receiver_address = new InternetAddress(receiver);
		message.setHeader("content-type", "text/html;charset=UTF-8");
		message.setFrom(sender_address);
		message.addRecipient(Message.RecipientType.TO, receiver_address);
		message.setSubject(subject);
		message.setContent(content, "text/html;charset=UTF-8");
		message.setSentDate(new java.util.Date());
		Transport.send(message);
// 		out.println("<h3>메일이 정상적으로 전송되었습니다.</h3>");
		response.sendRedirect("login.jsp");

	} catch (Exception e) {
		out.println("SMTP 서버가 잘못 설정되었거나, 서비스에 문제가 있습니다.");
		e.printStackTrace();
	}
%>
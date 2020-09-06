<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.List"%>
<%@page import="board.boardDAO"%>
<%@page import="board.boardBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author" content="">
<title>book</title>

<link
	href="https://fonts.googleapis.com/css?family=Nanum+Gothic|Nanum+Gothic+Coding|Noto+Serif+KR|Caveat+Brush&display=swap"
	rel="stylesheet">
<link href="vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
<link href="vendor/fontawesome-free/css/all.min.css" rel="stylesheet"
	type="text/css">
<link href="https://fonts.googleapis.com/css?family=Montserrat:400,700"
	rel="stylesheet" type="text/css">
<link href='https://fonts.googleapis.com/css?family=Kaushan+Script'
	rel='stylesheet' type='text/css'>
<link
	href='https://fonts.googleapis.com/css?family=Droid+Serif:400,700,400italic,700italic'
	rel='stylesheet' type='text/css'>
<link
	href='https://fonts.googleapis.com/css?family=Roboto+Slab:400,100,300,700'
	rel='stylesheet' type='text/css'>
<link href="../css/main.css" rel="stylesheet" type="text/css">


</head>
<body id="page-top">
	<!-- 헤더파일들어가는 곳 -->
	<jsp:include page="../inc/top.jsp" />
	<!-- 헤더파일들어가는 곳 -->
	<div class="masthead">
		<div class="container">
			<div class="intro-text">
				<div class="intro-heading text-uppercase">Welcome To Our
					Salon!</div>
				<a class="btn btn-primary btn-xl text-uppercase js-scroll-trigger"
					href="#aboutUs">Tell Me More</a>
			</div>
		</div>
	</div>
	<!-- 메인 콘텐츠 들어가는 곳 -->
	<div class="bk" style="text-align: center;">
		<a href=#aboutUs><pre>  ▼  </pre></a>
	</div>
	<section class="page-section" id="aboutUs">
		<div class="container2">
			<h1>글이 삶을 바꾸기는 어려워요. 하지만 종종 좋은 문장은 오래 남아 울림을 만듭니다.</h1>
			<h2>북쌀롱은 그런 문장들이 모이는 곳입니다.</h2>
			<h2>이곳이 방문자님에게도 잔잔하게 찰랑거리는 공간이길 바랍니다♥</h2>
		</div>
		<div class="uline"></div>
		<div class="sentence">
			<div class="1stt" style="text-align: center;">
				<label style="font-size: 22px;"><b><br>한문장 </b></label>
				<%
					boardBean bb = new boardBean();
					boardDAO bdao = new boardDAO();
					int count = bdao.getBoardCount();

					int pageSize = 10;
					String pageNum = request.getParameter("pageNum");
					if (pageNum == null) {
						pageNum = "1";
					}

					int currentPage = Integer.parseInt(pageNum);
					int startRow = currentPage * pageSize - (pageSize - 1);
					List boardList = bdao.getBoardList(startRow, pageSize);
					SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
				%>
				<table class="mainT" border="1">
					<%
						for (int i = 0; i < boardList.size(); i++) {
							bb = (boardBean) boardList.get(i);
					%>
					<tr>
						<td class="contxt"><a
							href="../b_sentence/s_content.jsp?num=<%=bb.getNum()%>&pageNum=<%=pageNum%>"><%=bb.getSubject()%></a></td>
						<td><%=sdf.format(bb.getDate())%></td>
					</tr>
					<%
						}
					%>
				</table>
			</div>
			<!--  map  -->
			<div class="2stt">
					<div id="scmap1">
			<b style="font-size: 22px;"><br> 오시는길 </b>
						<jsp:include page="map.jsp"></jsp:include>
					</div>
			</div>
		</div>
	</section>

	<!-- Contact -->
	<section class="page-section" id="contact">
		<div class="container1">
			<div class="row">
				<div class="col-lg-12 text-center">
					<h2 class="section-heading text-uppercase">Contact Us</h2>
					<h3 class="section-subheading text-muted">문의사항을 보내주세요.</h3>
				</div>
			</div>
			<div class="row1">
				<div class="col-lg-12">
					<form action="../mail/mailSend.jsp" method="post"
						name="sentMessage" novalidate="novalidate">
						<div class="row">
							<div class="col-md-6">
								<div class="form-group">
									<input class="form-control" id="sendermail" name="sender"
										type="email" placeholder="보내시는분 메일 *" required="required"
										data-validation-required-message="이름을 입력하세요.">
									<p class="help-block text-danger"></p>
								</div>
								<div class="form-group">
									<input class="form-control" id="email" name="receiver"
										type="email" value="abc@gmail.com"
										data-validation-required-message="이메일을 입력하세요.">
									<p class="help-block text-danger"></p>
								</div>
							</div>
							<div class="col-md-6">
								<div class="form-group">
									<textarea class="form-control" id="message" name="content"
										placeholder="내용입력 *" required="required"
										data-validation-required-message="내용을 입력해주세요."></textarea>
									<p class="help-block text-danger"></p>
								</div>
							</div>
							<div class="clearfix"></div>
							<div class="col-lg-12 text-center">
								<div id="success"></div>
								<input id="sendMessageButton"
									class="btn btn-primary btn-xl text-uppercase" type="submit"
									value="메일보내기">
							</div>
						</div>
					</form>
				</div>
			</div>
		</div>
	</section>



	<!-- 메인 콘텐츠 들어가는 곳 -->
	<div class="clear"></div>
	<!-- 푸터 들어가는 곳 -->
	<jsp:include page="../inc/bottom.jsp" />
	<!-- 푸터 들어가는 곳 -->


</body>
</html>
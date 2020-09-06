<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<header>
<div id="top">
<% //String id=(String)세션값 가져오기  
//로그인 하지 않았을 때, 세션값 있냐 없냐 물어보는데, 세션값 없으면 login/join 보이고 
//세션값 있으면 ...님이 로그인 했다.  logout

String id=(String)session.getAttribute("id");
if(id==null){%>
<div id="login"><a href="../member/login.jsp">로그인</a> ┃ <a href="../member/join.jsp">회원가입</a></div>	
<%}else{
	if(id.equals("admin")){%>
	<div id="login"><span id="loginId"><%=id %></span> 님이 로그인 하셨습니다.   　<a href="../member/logout.jsp">로그아웃</a> ┃ <a href="../member/info.jsp">내정보 </a> ┃
	 <a href="../member/memberList.jsp">회원관리</a></div>
<%	}else{%>
	<div id="login"><span id="loginId"><%=id %></span> 님이 로그인 하셨습니다.   　<a href="../member/logout.jsp">로그아웃</a> ┃ <a href="../member/info.jsp">내정보</a></div>
<%	}
} %>

<a class="navbar-brand js-scroll-trigger" href="../main/main.jsp">
      <img src="../images/logo4.png" width="300px"alt="Fun Web" id="logo"></a>
</div>

  <!-- Navigation -->
  <nav class="navbar navbar-expand-lg navbar-dark fixed-top" id="mainNav">
    <div class="container">
      <div class="collapse navbar-collapse" id="navbarResponsive">
        <ul class="navbar-nav text-uppercase ml-auto">
          <li class="nav-item">
            <a class="nav-link" href="../b_sentence/s_list.jsp">한문장</a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="../b_write/handWrite.jsp">필사</a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="../b_gathering/g_list.jsp">모임</a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="../b_center/bookSalon.jsp">후기</a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="../main/main.jsp?#contact">Contact</a>
          </li>
        </ul>
      </div>
    </div>
  </nav>
  
</header>
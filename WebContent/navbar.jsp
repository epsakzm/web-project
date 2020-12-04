<%@page contentType="text/html; charset=utf-8"%>
<%@ page import="java.io.PrintWriter"%>
<%
	String userID = null;
	if (session.getAttribute("userID") != null) {
		userID = (String) session.getAttribute("userID");
	}
	PrintWriter writer = response.getWriter();
	String url = request.getRequestURI().toString();
%>
<nav class="navbar navbar-inverse">
	<div class="navbar-header">
		<button type="button" class="navbar-toggle collapsed"
			data-toggle="collapse" data-target="#bs-example-navbar-collapse-1"
			aria-expanded="false">
			<span class="icon-bar"></span> <span class="icon-bar"></span> <span
				class="icon-bar"></span>
		</button>
		<a class="navbar-brand" href="main.jsp">WEBSSSSSSSITE</a>
	</div>
	<div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
		<ul class="nav navbar-nav">
			<%
				if (url.contains("main")) {
			%>
			<li class="active"><a href="main.jsp">메인</a></li>
			<li><a href="board.jsp">게시판</a></li>
			<%
				} else if (url.contains("board")) {
			%>
			<li><a href="main.jsp">메인</a></li>
			<li class="active"><a href="board.jsp">게시판</a></li>
			<%
				} else {
			%>
			<li><a href="main.jsp">메인</a></li>
			<li><a href="board.jsp">게시판</a></li>
			<%
				}
			%>
		</ul>
		<%
			if (userID == null) {
		%>
		<ul class="nav navbar-nav navbar-right">
			<li><a href="./join.jsp"><span
					class="glyphicon glyphicon-user"></span> 회원가입</a></li>
			<li><a href="#myModal" data-toggle="modal"><span
					class="glyphicon glyphicon-log-in"></span> 로그인</a></li>
		</ul>
		<%
			} else {
		%>
		<ul class="nav navbar-nav navbar-right">
			<li><a href="./user.jsp"><span
					class="glyphicon glyphicon-user"></span> 회원정보</a></li>
			<li><a onclick="return confirm('로그아웃 하시겠습니까?')"
				href="./processLogout.jsp"><span
					class="glyphicon glyphicon-log-out"></span> 로그아웃</a></li>
		</ul>
		<%
			}
		%>
	</div>
</nav>
<%@include file="login.jsp" %>
<%@ page language="java" contentType="text/html; charset=utf-8"%>
<%@ page import="user.User" %>
<%@ page import="user.UserDAO" %>
<%@ page import="java.io.PrintWriter" %>
<!doctype html>
<html>
<head>
<style>
@import url("https://fonts.googleapis.com/css?family=Lato:400,400i,700")
	;

body {
	margin: 0;
	font-family: 'Lato', sans-serif;
}

.header {
	min-height: 60vh;
	background: #009FFF;
	/*background: linear-gradient(to right, #ec2F4B, #009FFF);  */
	background: #000000; color : white;
	clip-path: ellipse(100vw 60vh at 50% 50%);
	display: flex;
	align-items: center;
	justify-content: center;
	color: white;
}

.details {
	text-align: center;
}

.profile-pic {
	height: 6rem;
	width: 6rem;
	object-fit: center;
	border-radius: 50%;
	border: 2px solid #fff;
}

.location p {
	display: inline-block;
}

.location svg {
	vertical-align: middle;
}

.stats {
	display: flex;
}

.stats .col-4 {
	width: 10rem;
	text-align: center;
}

.heading {
	font-weight: 400;
	font-size: 1.3rem;
	margin: 1rem 0;
}
</style>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="css/bootstrap.css">
<link rel="stylesheet" href="css/custom.css">
<title></title>
</head>

<body>
	<%
		String userID = null;
		PrintWriter write = response.getWriter();
		if (session.getAttribute("userID") != null) {
			userID = (String) session.getAttribute("userID");
		}
		User user = new UserDAO().findUserById(userID);
		if(user == null) {
			write.println("<script>alert('로그인이 필요합니다.')</script>");
			response.sendRedirect("main.jsp");
		}
	%>
	<jsp:include page="navbar.jsp"></jsp:include>
	<section class="profile">
		<header class="header">
			<div class="details">
				<img src="assets/img/avatar.png" alt="John Doe" class="profile-pic">
				<h1 class="heading"><%=user.getUserID() %></h1>
				<div class="location">
					<svg width="18" height="18" viewBox="0 0 24 24" fill="currentColor">
  <path
							d="M12,11.5A2.5,2.5 0 0,1 9.5,9A2.5,2.5 0 0,1 12,6.5A2.5,2.5 0 0,1 14.5,9A2.5,2.5 0 0,1 12,11.5M12,2A7,7 0 0,0 5,9C5,14.25 12,22 12,22C12,22 19,14.25 19,9A7,7 0 0,0 12 ,2Z"></path>
</svg>
					<p><%=user.getUserAddress() %></p>
				</div>
				<div class="stats">
					<div class="col-4">
						<h4><%
							if(user.getUserGender().equals("남자"))
								out.println("MALE");
							else 
								out.println("FEMALE");
						%></h4>
						<p>GENDER</p>
					</div>
					<div class="col-4">
						<h4>MEMBER</h4>
						<p>TYPE</p>
					</div>
					<div class="col-4">
						<h4><%=user.getUserEmail() %></h4>
						<p>EMAIL</p>
					</div>
				</div>
			</div>
		</header>
	</section>
</body>
</html>
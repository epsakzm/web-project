<%@ page language="java" contentType="text/html; charset=utf-8"%>
<%@ page import="user.UserDAO"%>
<%@ page import="java.io.PrintWriter"%>
<%
	request.setCharacterEncoding("UTF-8");
%>
<jsp:useBean id="user" class="user.User" scope="page" />
<jsp:setProperty property="userID" name="user" />
<jsp:setProperty property="userPassword" name="user" />
<!DOCTYPE html>
<html>
<head>
<title>Insert title here</title>
</head>
<body>
	<%
		PrintWriter script = response.getWriter();
		String userID = null;
		if(session.getAttribute("userID") != null) {
			userID = (String) session.getAttribute("userID");
		}
		if(userID != null) {
			script.println("<script>alert('이미 로그인 되어 있습니다.')</script>");
			response.sendRedirect("main.jsp");
		}
		UserDAO userDAO = new UserDAO();
		String id = request.getParameter("userID");
		String pass = request.getParameter("userPassword");
		int result = userDAO.login(id, pass);
		if (result == 1) {
			session.setAttribute("userID", user.getUserID());
		} else if (result == 0) {
			script.println("<script>alert('비밀번호가 틀립니다.')</script>");
		} else if (result == -1) {
			script.println("<script>alert('존재하지 않는 아이디입니다.')</script>");
		} else if (result == -2) {
			script.println("<script>alert('DB오류')</script>");
		}
		response.sendRedirect("board.jsp");
	%>
</body>
</html>
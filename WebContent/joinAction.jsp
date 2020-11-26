<%@ page language="java" contentType="text/html; charset=utf-8"%>
<%@ page import="user.UserDAO"%>
<%@ page import="java.io.PrintWriter"%>
<%
	request.setCharacterEncoding("UTF-8");
%>
<jsp:useBean id="user" class="user.User" scope="page" />
<jsp:setProperty property="userID" name="user" />
<jsp:setProperty property="userPassword" name="user" />
<jsp:setProperty property="userName" name="user" />
<jsp:setProperty property="userGender" name="user" />
<jsp:setProperty property="userEmail" name="user" />
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
			script.println("<script>");
			script.println("alert('이미 로그인 되어 있습니다.')");
			script.println("location.href='main.jsp'");
			script.println("<script>");
		}
		if (user.getUserID() == null || user.getUserPassword() == null ||
		user.getUserName() == null || user.getUserGender() == null || user.getUserEmail() == null) {
			script.println("<script>");
			script.println("alert('입력이 안 된 사항이 있습니다.')");
			script.println("history.back()");
			script.println("<script>");
		} else {
			UserDAO userDAO = new UserDAO();
			int result = userDAO.join(user);
			if (result == -1) {
				script.println("<script>");
				script.println("alert('이미 존재하는 아이디입니다.')");
				script.println("history.back()");
				script.println("<script>");
			} else {
				session.setAttribute("userID", user.getUserID());
				script.println("<script>");
				script.println("location.href = 'main.jsp'");
				script.println("</script>");
			}
		}
	%>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=utf-8"%>
<%@ page import="board.BoardDAO"%>
<%@ page import="board.Board"%>
<%@ page import="java.io.PrintWriter"%>
<%
	request.setCharacterEncoding("UTF-8");
%>
<!DOCTYPE html>
<html>
<head>
<title>Insert title here</title>
</head>
<body>
	<%
		PrintWriter script = response.getWriter();
		String userID = null;
		if (session.getAttribute("userID") != null) {
			userID = (String) session.getAttribute("userID");
		}
		if (userID == null) {
			script.println("<script>");
			script.println("alert('로그인을 하세요.')");
			script.println("location.href='login.jsp'");
			script.println("<script>");
		} 
		int bbsID = 0;
		if (request.getParameter("bbsID") != null) {
			bbsID = Integer.parseInt(request.getParameter("bbsID"));
		}
		if (bbsID == 0) {
			script.println("<script>");
			script.println("alert('유효하지 않은 글입니다.')");
			script.println("location.href='bbs.jsp'");
			script.println("<script>");
		}
		Board bbs = new BoardDAO().getBbs(bbsID);
		if(!userID.equals(bbs.getUserID())) {
			script.println("<script>");
			script.println("alert('권한이 없습니다.')");
			script.println("location.href='bbs.jsp'");
			script.println("<script>");
		} else {
			BoardDAO bbsDAO = new BoardDAO();
			int result = bbsDAO.delete(bbsID);
			if (result == -1) {
		script.println("<script>");
		script.println("alert('글 삭제에 실패했습니다.')");
		script.println("history.back()");
		script.println("<script>");
			} else {
		script.println("<script>");
		script.println("location.href = 'bbs.jsp'");
		script.println("</script>");
			}
		}
	%>
</body>
</html>
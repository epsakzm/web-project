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
		BoardDAO boardDAO = new BoardDAO();
		if (session.getAttribute("userID") != null) {
			userID = (String) session.getAttribute("userID");
		}
		if (userID == null) {
			script.println("<script>");
			script.println("alert('로그인이 필요해요!')");
			script.println("location.href='login.jsp'");
			script.println("</script>");
		}
		int boardID = 0;
		if (request.getParameter("boardID") != null) {
			boardID = Integer.parseInt(request.getParameter("boardID"));
		}
		if (boardID == 0) {
			script.println("<script>");
			script.println("alert('유효하지 않은 글입니다!')");
			script.println("location.href='board.jsp'");
			script.println("</script>");
		}
		Board board = new BoardDAO().getBbs(boardID);
		if (!userID.equals(board.getUserID())) {
			script.println("<script>");
			script.println("alert('권한이 없습니다!')");
			script.println("location.href='board.jsp'");
			script.println("</script>");
		} else {

			int result = boardDAO.update(boardID, request.getParameter("boardTitle"),
					request.getParameter("boardContent"));
			if (result == -1) {
				script.println("<script>");
				script.println("alert('글 수정에 실패했습니다!')");
				script.println("history.back()");
				script.println("</script>");
			} else {
				script.println("<script>");
				script.println("location.href = 'board.jsp'");
				script.println("</script>");
			}
		}
	%>
</body>
</html>
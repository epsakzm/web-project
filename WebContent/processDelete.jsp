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
			script.println("<script>alert('로그인을 하세요.')</script>");
		} 
		int boardID = 0;
		if (request.getParameter("boardID") != null) {
			boardID = Integer.parseInt(request.getParameter("boardID"));
		}
		if (boardID == 0) {
			script.println("<script>alert('유효하지 않은 글입니다.')</script>");
		}
		Board board = new BoardDAO().getBoardById(boardID);
		if(!userID.equals(board.getUserID())) {
			script.println("<script>alert('권한이 없습니다.')</script>");
		} else {
			BoardDAO boardDAO = new BoardDAO();
			int result = boardDAO.delete(boardID);
			if (result == -1) {
				script.println("<script>alert('글 삭제에 실패했습니다.')</script>");
			}
		}
		response.sendRedirect("board.jsp");
	%>
</body>
</html>
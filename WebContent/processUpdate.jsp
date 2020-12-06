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
			script.println("<script>alert('로그인이 필요해요!')<script>");

		}
		int boardID = 0;
		if (request.getParameter("boardID") != null) {
			boardID = Integer.parseInt(request.getParameter("boardID"));
		}
		if (boardID == 0) {
			script.println("<script>alert('유효하지 않은 글입니다!')</script>");
		}
		Board board = new BoardDAO().getBoardById(boardID);
		if (!userID.equals(board.getUserID())) {
			script.println("<script>alert('권한이 없습니다!')</script>");
		} else {
			int result = boardDAO.update(boardID, request.getParameter("boardTitle"),
					request.getParameter("boardContent"));
			if (result == -1) {
				script.println("<script>alert('글 수정에 실패했습니다!')</script>");
			} else {
				script.println("<script>location.href = 'board.jsp'</script>");
			}
		}
		response.sendRedirect("main.jsp");
	%>
</body>
</html>
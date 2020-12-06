<%@ page language="java" contentType="text/html; charset=utf-8"%>
<%@ page import="board.BoardDAO"%>
<%@ page import="board.Board"%>
<%@ page import="java.io.PrintWriter"%>
<%
	request.setCharacterEncoding("UTF-8");
%>
<jsp:useBean id="board" class="board.Board" scope="page"></jsp:useBean>
<jsp:setProperty property="boardTitle" name="board" />
<jsp:setProperty property="boardContent" name="board" />
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
			script.println("<script>");
		} else {
			if (board.getBoardTitle() == null || board.getBoardContent() == null) {
				script.println("<script>alert('입력이 안 된 사항이 있습니다.')</script>");
			} else {
				BoardDAO boardDAO = new BoardDAO();
				int result = boardDAO.write(board.getBoardTitle(), userID, board.getBoardContent());
				if (result == -1) {
					script.println("<script>alert('글쓰기에 실패했습니다.')</script>");
				}
			}
		}
		response.sendRedirect("main.jsp");
	%>
</body>
</html>
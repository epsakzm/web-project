<%@ page language="java" contentType="text/html; charset=utf-8"%>
<%@ page import="java.io.PrintWriter"%>
<%@ page import="board.Board" %>
<%@ page import="board.BoardDAO" %>
<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="css/bootstrap.css">
<link rel="stylesheet" href="css/custom.css">
<style>
 td {
	padding-top: 50px;
	
}
</style>
<title>Insert title here</title>
</head>
<body>
	<%
		PrintWriter script = response.getWriter();
		String userID = null;
		if (session.getAttribute("userID") != null) {
			userID = (String) session.getAttribute("userID");
		}
		if(userID == null) {
			script.println("<script>");
			script.println("alert('로그인이 필요합니다.')");
			script.println("location.href='login.jsp'");
			script.println("</script>");
		}
		int boardID = 0;
		if (request.getParameter("boardID") != null) {
			boardID = Integer.parseInt(request.getParameter("boardID"));
		}
		if (boardID == 0) {
			script.println("<script>");
			script.println("alert('유효하지 않은 글입니다.')");
			script.println("location.href='board.jsp'");
			script.println("</script>");
		}
		Board board = new BoardDAO().getBbs(boardID);
		if(!userID.equals(board.getUserID())) {
			script.println("<script>");
			script.println("alert('권한이 없습니다.')");
			script.println("location.href='board.jsp'");
			script.println("</script>");
		}
	%>
	<jsp:include page="navbar.jsp"></jsp:include>
	<div class="container">
		<div class="row">
			<form action="processUpdate.jsp?boardID=<%=boardID %>" method="post">
				<table class="table table-striped" style="text-align: center; border: 1px solid #dddddd">
				<thead>
					<tr>
						<th colspan="2" style="background-color: #eeeeee; text-align: center;">글 수정</th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td><span class="label label-default">글 제목</span></td>
						<td><input type="text" class="form-control" placeholder="글 제목" name="boardTitle" maxlength="50" ><%=board.getBoardTitle()%></td>
					</tr>
					<tr>
						<td>asdfaaaaaaaaaaaaaaaaa</td>
						<td><span class="label label-dafault">글 내용</span><textarea class="form-control" placeholder="글 내용" name="boardContent" maxlength="2048" style="height: 350px;" ><%=board.getBoardContent()%></textarea></td>
					</tr>
				</tbody>
			</table>
			<input type="submit" class="btn btn-dark pull-right" value="글수정" />
			</form>
		</div>
	</div>
	<script type="text/javascript"
		src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script type="text/javascript" src="js/bootstrap.js"></script>
</body>
</html>
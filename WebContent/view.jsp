<%@ page language="java" contentType="text/html; charset=utf-8"%>
<%@ page import="java.io.PrintWriter"%>
<%@ page import="board.Board"%>
<%@ page import="board.BoardDAO"%>
<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="css/bootstrap.css">
<link rel="stylesheet" href="css/custom.css">
<style>
.btn-lg {
	position: absolute;
	left: 0;
	right: 0;
	margin-left: auto;
	margin-right: auto;
	margin-top: 30px;
}
</style>
<script>
	$("#signin").on("click", function() {
		$('#myModal1').modal('hide');
	});
	//trigger next modal
	$("#signin").on("click", function() {
		$('#myModal2').modal('show');
	});
	function sub() {
		document.form1.submit();
	}
</script>
<title>게시글 조회</title>
</head>
<body>
	<%
		String userID = null;
		PrintWriter script = response.getWriter();
		if (session.getAttribute("userID") != null) {
			userID = (String) session.getAttribute("userID");
		} else {
			script.println("<script>");
			script.println("alert('권한이 없습니다.')");
			script.println("location.href='board.jsp'");
			script.println("</script>");
		}
		int boardID = -1;
		if (request.getParameter("boardID") != null) {
			boardID = Integer.parseInt(request.getParameter("boardID"));
			new BoardDAO().addViewCount(boardID);
		}
		if (boardID == -1) {
			script.println("<script>");
			script.println("alert('유효하지 않은 글입니다.')");
			script.println("location.href='board.jsp'");
			script.println("</script>");
		}
		Board board = new BoardDAO().getBoardById(boardID);
		if (userID == null) {
			script.println("<script>");
			script.println("alert('로그인이 필요합니다.')");
			script.println("location.href='board.jsp'");
			script.println("</script>");
		}
	%>
	<jsp:include page="navbar.jsp"></jsp:include>
	<div class="container">
		<div class="row">
			<table class="table table-striped" style="border: 1px solid #dddddd">
				<thead>
					<tr>
						<th colspan="3"
							style="background-color: #eeeeee; text-align: center;">게시판</th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td>글 제목</td>
						<td colspan="2"><%=board.getBoardTitle()%></td>
					</tr>
					<tr>
						<td>조회 수</td>
						<td colspan="2"><%=board.getViews()%></td>
					</tr>
					<tr>
						<td>작성자</td>
						<td colspan="2"><%=board.getUserID()%></td>
					</tr>
					<tr>
						<td>작성 일자</td>
						<td colspan="2"><%=board.getCreatedDate()%></td>
					</tr>
					<tr>
						<td>내용</td>
						<td colspan="2" style="min-height: 200px; text-align: left;"><%=board.getBoardContent()%></td>
					</tr>
				</tbody>
			</table>
			<a href="board.jsp" class="btn btn-dark">목록</a>
			<%
				if (userID != null && userID.equals(board.getUserID())) {
			%>
			<button class="btn btn-outline-dark" data-toggle="modal"
				data-target="#myModal1">수정</button>
			<a onclick="return confirm('정말로 삭제하시겠습니까?')"
				href="processDelete.jsp?boardID=<%=boardID%>"
				class="btn btn-outline-dark">삭제</a>
			<%
				}
			%>
		</div>
	</div>

	<div class="modal fade" id="myModal1" tabindex="-1" role="dialog"
		aria-labelledby="myModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">

					<h4 class="modal-title" id="myModalLabel">글 수정</h4>
				</div>
				<div class="modal-body">
					<form name="form1"
						action='./processUpdate.jsp?boardID=<%=boardID%>' method="post">
						<div class="form-group">
							<label for="title">제목</label> <input id="title1"
								value="<%=board.getBoardTitle()%>" type="text"
								class="form-control" name="boardTitle" placeholder="title">
						</div>
						<div class="form-group">
							<label for="viewCount">조회 수</label> <input id="title1"
								value="<%=board.getViews()%>" type="text"
								class="form-control" placeholder="title" readonly>
						</div>
						<div class="form-group">
							<label for="user">작성자</label> <input id="user"
								value="<%=board.getUserID()%>" type="text" class="form-control"
								name="boardTitle" placeholder="title" readonly>
						</div>
						<div class="form-group">
							<label for="date">게시일</label> <input id="date"
								value="<%=board.getCreatedDate()%>" type="text"
								class="form-control" name="boardTitle" placeholder="title"
								readonly>
						</div>
						<div class="form-group">
							<label for="content">내용</label>
							<textarea id="content1" class="form-control" name="boardContent"
								placeholder="content"><%=board.getBoardContent()%></textarea>
						</div>
						<div class="modal-footer">
							<button type="button" onclick="sub()" class="btn btn-black"
								id="signin">수정</button>
							<button type="button" class="btn btn-outline-black"
								data-dismiss="modal">Close</button>
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>

	<script type="text/javascript"
		src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script type="text/javascript" src="js/bootstrap.js"></script>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=utf-8"%>
<%@ page import="java.io.PrintWriter"%>
<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="css/bootstrap.css">
<link rel="stylesheet" href="css/custom.css">
<title>글 작성</title>
</head>
<body>
	<%
		String userID = null;
		if (session.getAttribute("userID") != null) {
			userID = (String) session.getAttribute("userID");
		}
	%>
	<jsp:include page="navbar.jsp"></jsp:include>
	<div class="container">
		<div class="row">
			<form action="processWrite.jsp" method="post">
				<table class="table table-striped" style="text-align: center; border: 1px solid #dddddd">
				<thead>
					<tr>
						<th colspan="2" style="color: #ffffff; background-color: #424242; text-align: center;">글 작성</th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td><input type="text" class="form-control" placeholder="글 제목" name="boardTitle" maxlength="50" required="required"></td>
					</tr>
					<tr>
						<td><textarea class="form-control" placeholder="글 내용" name="boardContent" maxlength="2048" style="height: 350px;" required="required"></textarea></td>
					</tr>
				</tbody>
			</table>
			<a href="#" class="btn btn-outline-dark pull-right" onclick="location.href='board.jsp'">취소</a>
			<input type="submit" class="btn btn-dark pull-right" value="작성" />
			</form>
		</div>
	</div>
	<script type="text/javascript"
		src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script type="text/javascript" src="js/bootstrap.js"></script>
</body>
</html>
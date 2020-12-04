<%@page contentType="text/html; charset=utf-8" %>
<div id="myModal" class="modal fade">
	<div class="modal-dialog modal-login">
		<div class="modal-content">
			<div class="modal-header">
				<h4 class="modal-title">로그인 해주세요!</h4>
				<button type="button" class="close" data-dismiss="modal"
					aria-hidden="true">&times;</button>
			</div>
			<div class="modal-body">
				<form action="processLogin.jsp" method="post">
					<div class="form-group">
						<input type="text" class="form-control" name="userID"
							placeholder="Username" required="required">
					</div>
					<div class="form-group">
						<input type="password" class="form-control" name="userPassword"
							placeholder="Password" required="required">
					</div>
					<div class="form-group">
						<button type="submit"
							class="btn btn-primary btn-lg btn-block btn-outline-dark">로그인</button>
					</div>
				</form>
			</div>
			<div class="modal-footer">
				<a href="#">비밀번호를 잊으셨나요!</a>
			</div>
		</div>
	</div>
</div>
function checkForm() {
	// 영문 대문자 또는 소문자로 시작하는 아이디, 길이는 5~15자, 끝날때 제한 없음
	// /^[A-Za-z]{1}[A-Za-z0-9]{3,19}$/
	var regId = /^[A-Za-z]{1}[A-Za-z0-9]{3,19}$/;
	// 최소 8자 최소 하나의 문자 및 하나의 숫자
	var regPass = /^(?=.*[A-Za-z])(?=.*\d)[A-Za-z\d]{8,}$/
	
	var regEmail = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;
	
	if(!regId.test(document.form1.userID.value)) {
		alert('아이디는 영어로 시작해야합니다. 길이 5 ~ 15 자');
		document.form1.userID.select();
		return;
	}
	
	if(!regPass.test(document.form1.userPassword.value)) {
		alert('최소 하나의 문자와 숫자가 있어야합니다. 8자 이상');
		document.form1.userPassword.select();
		return;
	}
	
	if(!regEmail.test(document.form1.userEmail.value)) {
		alert('이메일을 확인해주세요');
		document.form1.userEmail.select();
		return;
	}
	document.form1.submit();
}
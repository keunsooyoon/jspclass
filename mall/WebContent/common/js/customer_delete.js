
function confirm_onClick() {

	var answer = confirm("정말로 탈퇴하시겠습니까?");
	
	if (answer) {
		document.customer_form.submit();
	} else {
		location.href = "./customer_maintenance.jsp"	
	}
}
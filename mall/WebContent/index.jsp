<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="../common/CSS/home.css">
<div id = "out_box">
	<div id = "header">
		<b>header</b>
	</div>
</div>
<div id="body_left">
	<form name="login_form" method="POST" action="./lobin_ses_create.jsp">
		<table>
			<tr>
			<th>아 이 디</th>
			<td><input type="text" name="cust_id" size="10" maxlength="10"
				required autofocus></td>
			</tr>
			<th>비밀번호</th>
			<td><input type="password" name="cust_pw" size="10" maxlength="10"
				required autofocus></td>
			</tr>
			<tr>
			<td colspan="2" style="text-align:center;">
			<%
			if (false) { //로그인 상태이면 단추들을 감추고
				out.print("<input type='submit' value='로그 인' disabled>"
						+"<input type='button' value='회원 가입' disabled</td>");
			
			} else { // 로그인 상태가 아니면 단추들을 보이게 설정
				out.print("<input type='submit' value='로그인'>"
				+ "<input type='button' value='회원 가입'</td>");
			}
			%>
		</table>
	
	</form>

</div>
</head>
<body>

</body>
</html>
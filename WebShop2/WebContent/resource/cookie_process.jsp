<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
		String user_id = request.getParameter("id");
		String user_pw = request.getParameter("ps");
		
		
		 //회원 아이디와 비밀번호 디비에서 조회후 확인
		
		
		Cookie cookie_id = new Cookie("userID", user_id);
		Cookie cookie_pw = new Cookie("userPW", user_pw);
		
		response.addCookie(cookie_id);
		response.addCookie(cookie_pw);
		
		out.print("쿠키 생성 성공<br>");
		out.print(user_id + "님 환영합니다.");
	
	%>
</body>
</html>
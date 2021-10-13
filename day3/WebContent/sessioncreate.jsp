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
session.setAttribute("id","어드민");
session.setAttribute("name", "홍길동");

out.print("세션 설정 끝");

%>
<br><br>
<%=session.getAttribute("id") %><br>
<%=session.getAttribute("name") %><br>
</body>
</html>
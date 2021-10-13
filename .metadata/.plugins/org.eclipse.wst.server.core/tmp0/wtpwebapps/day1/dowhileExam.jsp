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
int su = 1;
int sum = 0;

do {
	sum = sum + su;
	su++;

}while (su <= 10);

%>
<%=sum %>
</body>
</html>
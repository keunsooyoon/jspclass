<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
1부터 10까지의 정수의 합 while

<%

int sum = 0;
int no = 1;

while (no <= 10) {
	sum = sum + no;
	no++;  // no = no + 1   ,   no += 1  
}

%>
<%=sum %>
</body>
</html>
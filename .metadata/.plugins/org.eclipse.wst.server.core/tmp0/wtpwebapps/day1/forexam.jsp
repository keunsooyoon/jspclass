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
int[] jumsu = {89,90,91};

int total = 0;
double avg = 0;


for(int i : jumsu){  //foreach
	total = total + jumsu[i];


}

avg = total / 3;
%>
<%=total %>
<%=avg %>



</body>
</html>
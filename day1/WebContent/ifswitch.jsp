<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>큰 수 찾기</title>
</head>
<body>
<%
	int su1 = 91;
	int su2 = 49;
	int max;
	
	if (su1 >= su2) {
		max = su1;
	} else {
		max = su2;
	}

%>

큰수 = <%=max %>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<jsp:include page="action_param2.jsp">
	<jsp:param name="date" value="<%=new java.util.Date() %>" />
</jsp:include>
</body>
</html>
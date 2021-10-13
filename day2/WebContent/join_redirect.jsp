<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ page import = "java.net.URLEncoder" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
	String cust_id = request.getParameter("id");
	String cust_pw = request.getParameter("pw");

	out.print(cust_id + "<br>");
	out.print(cust_pw);
	
	String para = "대한민국";
	String encode_para = URLEncoder.encode(para,"utf-8");
%>
	<p>3초 뒤에 자동으로 이동합니다. </p>
<%

	

	//Thread.sleep(3000);
	
	
	//response.sendRedirect("redirect.jsp");
	response.sendRedirect("redirect_check.jsp?para=" + encode_para);
%>


</body>
</html>
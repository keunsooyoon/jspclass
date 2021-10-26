<%@ page contentType = "text/html" pageEncoding="utf-8" %>
<!-- pageEncoding="utf-8" GET 방식 한글 처리 -->


<%
	request.setCharacterEncoding("utf-8");
	//한글 처리방법 POST 방식 한글 처리  
	String uid = request.getParameter("id");
	String res = "<h3>사용자 아이디 : " + uid + "</h3>";
	out.print(res);
%>

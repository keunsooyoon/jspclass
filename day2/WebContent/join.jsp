<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!--# request 전송시 한글 깨짐 방지  (get방식으로 한글 전달시는 별도 설정)-->
<% request.setCharacterEncoding("UTF-8"); %>    



<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

아이디 : <%=request.getParameter("id") %>
패스워드 : <%=request.getParameter("pw") %>
이름 : <%=request.getParameter("name") %>
성별 : <%=request.getParameter("gender") %>
취미 : 
<%
String[] hobby = request.getParameterValues("hobby");

if(hobby != null) {
	for(int i = 0 ; i < hobby.length ; i++){
		out.print(hobby[i] + " ");
	}
} else {
	out.print("취미를 선택하지 않았습니다. ");
}

%>


</body>
</html>
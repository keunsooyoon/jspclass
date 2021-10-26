<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String uid = request.getParameter("id");
	String res = "<h3>사용자 아이디 : " + uid + "</h3>";
	out.print(res);
%>
<%@ include file="loginTime.jsp" %>

<!-- 
login5의 8행에 loginTime.jsp 의 코드를 복사해 놓은 것과 같은 효과가 나타난다. 
주의사항 - 두 파일간에 이름이 같은 변수가 있어서는 안된다. 예를 들면 loginTime.jsp의 변수 res1
res로 변경하면 에러가 발생한다. 복사하는 과정에서 기존 login5에 정의된 res 변수와 충돌이 일어난다. 

--> 
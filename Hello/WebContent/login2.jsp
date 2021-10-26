<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!-- 

page 지시어 - JSP 페이지 처리 방법을 정의한다. 
			JSP 페이지를 처리하고 실행하는데 필요한 속성들을 정의한다. 
			문서의 종류, 인코딩 방식(한글), 사용할 자바 클래스 import,
			
include 지시어   - JSP 페이지에 다른 문서를 포함시킨다. 

 -->
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<!--HTML 주석  -->

<%--JSP 주석 --%>

<% // 스크립트릿 시작
	String uid = request.getParameter("id");
	//request.getParameter("id"); 전달받은 id값을 uid 변수로 저장
	String res = "<h3>User ID : " + uid + "</h3>";
	//html 태그를 문자열로 표현한다. 
	out.print(res);
	//res를 응답 메시지로 출력 
	//jsp 의 out 이  서블릿의 doGet() 함수에서 이용되는 
	//response.getWriter() 와 동일한 역할을 수행한다. 
	//out 과 같이 JSP에서 별도의 선언 없이 사용할 수 있는 미리 정의된 객체를
	// 내장 객체 Implicit Object 라고 한다. 
%>  //스크립틀릿 종료

</body>
</html>
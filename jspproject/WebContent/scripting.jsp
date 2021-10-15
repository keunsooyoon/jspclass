<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<% //스크립틀릿 태그
		for (int i = 1 ; i <= count ; i++) {
			out.print("Java Server Page " + i + ". <br>");
		}
	%>

	<!--표현문 태그 - 문자열 형태로 출력 -->
	<%=makeItLower("Hello World") %>
	
	
	<%! //선언문 태그, 전역 변수와 메소드를 정의
	    //스트립틀릿보다 뒤에서 선언해도 동작한다. 
	    // 클래스 수준의 멤버 변수가 되무로 전역 변수로 사용된다. 
	    // 해당 페이지 내의 모든 스크립트 태그가 참조할 수 있는 전역변수
	
	int count = 3; 
	
	String makeItLower(String data) {
		return data.toLowerCase();
	}
	
	%>
	
</body>
</html>
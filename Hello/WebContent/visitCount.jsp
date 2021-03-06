<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String strcnt = (String) application.getAttribute("counter");
	//getAttribute()함수를 사용하여 "counter"속성 값을 가져온다. 
	//기본적으로는 object 형태로 값을 반환하므로 String로 변환한다. 
	int count = (strcnt == null) ? 0 : Integer.valueOf(strcnt);
	//처음 실행 시에는 null 이기 때문에 0을 지정
	//null이 아니면 Integer.valueOf()함수를 사용해서 String을 정수로 변환
	
	out.print("방문자수 : " + count);  // 출력
	application.setAttribute("counter", String.valueOf(++count));
	//count값을 증가시킨 후 String으로 변환하고 그 값을 
	//application의 counter 속성 값으로 저장한다. 
	// 방문자 수는 서버가 실행되는 동안만 유지된다. 서버 재실행 시 방문자 수는 0으로
	// 초기화 된다. 따라서 방문자 수 카운트를 계속 유지시키려면 데이터 베이스의 
	// 도움이 필요하다. 



%>
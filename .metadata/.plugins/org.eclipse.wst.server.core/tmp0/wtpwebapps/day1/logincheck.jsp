<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인 인증</title>
</head>
<body>


<%

int season = 7;
String msg1 = "";

switch (season){
case 12: case 1: case 2: msg1 = "winter";
 break;
case 3: case 4: case 5: msg1 = "spring";
 break;
case 6: case 7: case 8: msg1 = "summer";
 break;
case 9: case 10: case 11: msg1 = "fall";
 break;
default : msg1 = "오류";
}

%>

<%=msg1 %>

</body>
</html>
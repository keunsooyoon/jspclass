<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

1부터 100까지의 홀수의 합을 구하다가 홀수의 합이 25보다 크거나 같으면 실행을 중단하고 최종합을 출력.
<br><br>
<% 
int sum = 0;
int no;

for (no = 1; no <= 100; no++) {
	if ( no % 2 == 0) {
		continue;
	} else {
		sum += no;   // sum = sum + no
%>				
	
	no = <%=no %> sum = <%=sum %><br>
				
<% 			
	}
	if (sum>=25) {
		break;
	}
}

%>

<%=sum %>



int sum = 0;
	for(int i = 0; i <=100; i++) {
		if(i%2==1){
			sum += i;
		} else if(sum >= 25) {
			break;
		} else {
			continue;
		}
	}
	out.print(sum);

</body>
</html>
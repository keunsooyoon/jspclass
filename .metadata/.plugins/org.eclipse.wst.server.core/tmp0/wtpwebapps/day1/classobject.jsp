<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<%!
class Account {
	String account_no = "";
	int balance = 0;
	
	Account(String account_no) { // 생성자 1. 클라스명과 동일  2. 리턴타입 없다. 
		this.account_no = account_no;
	}
	
	int deposit(int amount){
		balance += amount;
		return balance;
	}
	
	int payment(int amount) {
		if (balance >= amount) {
			balance -= amount;
			return balance;
		} else {
			return balance;
		}
	}
}
%>
<%

int balance = 0;


Account account1 = new Account("11010011");
out.print("계좌번호 :" + account1.account_no + "<br>");
out.print("잔액 :" + account1.balance + "<br><br>");


Account account2 = new Account("22020022");
out.print("계좌번호 :" + account2.account_no + "<br>");
out.print("잔액 :" + account2.balance + "<br><br>");


account1.deposit(5000);
out.print("5000원 입금 후 account1 잔액 :" + account1.balance + "<br><br>");

account2.deposit(3000);
out.print("3000원 입금 후 account2 잔액 :" + account2.balance + "<br><br>");

%>

</body>
</html>
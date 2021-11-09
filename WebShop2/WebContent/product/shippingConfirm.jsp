<%@page import="java.net.URLDecoder"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%@ include file = "/header.jsp" %>
	<div class="alert alert-secondary" role="alert">
		<h1 class="display-3">배송 정보 확인</h1>
	</div>
<% request.setCharacterEncoding("UTF-8");
	String pname = request.getParameter("pname");
	String price = request.getParameter("price");

	String shipping_name= "";
	String shipping_shippingdate= "";
	String shipping_account= "";
	String shipping_zipcode= "";
	String shipping_address= "";

	Cookie[] cookies = request.getCookies();

	if (cookies != null) {
		for( int i = 0 ; i < cookies.length ; i++) {
			Cookie thisCookie = cookies[i];
			String n = thisCookie.getName();
			if (n.equals("shipping_name"))
				shipping_name = URLDecoder.decode((thisCookie.getValue()), "utf-8");
			if (n.equals("shipping_shippingdate"))
				shipping_shippingdate = URLDecoder.decode((thisCookie.getValue()), "utf-8");
			if (n.equals("shipping_account"))
				shipping_account = URLDecoder.decode((thisCookie.getValue()), "utf-8");
			if (n.equals("shipping_zipcode"))
				shipping_zipcode = URLDecoder.decode((thisCookie.getValue()), "utf-8");
			if (n.equals("shipping_address"))
				shipping_address = URLDecoder.decode((thisCookie.getValue()), "utf-8");
		}
	}

%>

	<div class="container con-8 alert-info">
	<div class="text-center">
		<h2>주문 영수증</h2>
	</div>
	
	<div class="row justify-content-between">
			<div class="col-4" align="left">
				<strong>배송 주소</strong> <br> 성명 : <% out.println(shipping_name); %><br> 
				우편번호 : <% 	out.println(shipping_zipcode);%><br> 
				주      소 : <%	out.println(shipping_address);%><br>
				은행계좌 : <%	out.println(shipping_account);%><br>
			</div>
			<div class="col-4" align="right">
				<p>	<em>배송일: <% out.println(shipping_shippingdate);	%></em>
			</div>
		</div>
		<div>
			<table class="table table-hover">			
			<tr>
				<th class="text-center">도서</th>
				<th class="text-center">#</th>
				<th class="text-center">가격</th>
				<th class="text-center">소계</th>
			</tr>
			<tr>
				<td class="text-center"><em><%=pname%> </em></td>
				<td class="text-center">1</td>
				<td class="text-center"><%=price%>원</td>
				<td class="text-center"><%=price%>원</td>
			</tr>

			<tr>
				<td> </td>
				<td> </td>
				<td class="text-right">	<strong>총액: </strong></td>
				<td class="text-center text-danger"><strong><%=price%> </strong></td>
			</tr>
			</table>			
				<a href="./shippingThanks.jsp"  class="btn btn-success" role="button"> 주문 완료 </a>
				<a href="./shippingCancel.jsp" class="btn btn-secondary" role="button"> 취소 </a>			
		</div>
	</div>
	<%@ include file = "/footer.jsp" %>	
</body>
</html>




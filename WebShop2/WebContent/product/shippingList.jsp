<%@page import="dao.*"%>
<%@page import="java.util.ArrayList"%>
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
  <h1 class="display-3">주문 목록</h1>
</div>
<div class="bd-example">
<table class="table table-hover">
  <thead>
    <tr>
      <th scope="col">#</th>
      <th scope="col">제품명</th>
      <th scope="col">가격</th>
      <th scope="col">주문상태</th>
    </tr>
  </thead>
  <tbody>
  
  <%
  	 ArrayList<ShippingObj> goods = (new ShippingDAO()).getList();
  
  	int i = goods.size();
  	for (ShippingObj good : goods) {	
  	
  %>
  
    <tr>
      <th scope="row"><%=i %></th>
      <td><%=good.getPname() %></td>
      <td><%=good.getPprice() %></td>
      <td><%=good.getPdate() %></td>
      <td><%=good.getPstatus() %></td>
      
    </tr>
   
   
   <%} %>
   
  </tbody>
</table>
</div>
<%@ include file = "/footer.jsp" %>

</body>
</html>
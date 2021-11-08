<%@page import="dao.ProductDAO"%>
<%@page import="dao.ProductObj"%>
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
	<jsp:include page = "../header.jsp" />
	
<div class="alert alert-secondary" role="alert">
			<h1 class="display-3">상품 업데이트</h1>
</div>	


<div class="bd-example">
<table class="table table-hover">
  <thead>
    <tr>
      <th scope="col">#</th>
      <th scope="col">제목</th>
      <th scope="col">작성자</th>
      <th scope="col">날짜</th>
    </tr>
  </thead>
  <tbody>
  
  <%
  	 ArrayList<ProductObj> products = (new ProductDAO()).getList();
  
  	int i = products.size();
  	for (ProductObj product : products) {	
  	
  %>
  
    <tr>
      <th scope="row"><%=i %></th>
      <td><%=product.getPname() %></a></td>
      <td><%=product.getPprice() %></td>
      <td><%=product.getPdescription() %></td>
      <td><a href="detailCheckProduct.jsp?id=<%=product.getPid() %>" class="btn btn-secondary" role="button">수정 &raquo;</a></td>	
      <td><a href="deleteCheckProduct.jsp?id=<%=product.getPid() %>" class="btn btn-secondary" role="button">삭제 &raquo;</a></td>	
    </tr>
   
   
   <%} %>
   
  </tbody>
</table>
</div>


	
	<jsp:include page = "../footer.jsp" />
</body>
</html>
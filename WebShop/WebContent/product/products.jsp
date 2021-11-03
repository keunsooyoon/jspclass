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
	
	<%
		ArrayList<ProductObj> products = (new ProductDAO()).getList();
	%>
		<div class = "container">
			<h1 class = "display-3">상품 목록</h1>
		</div>
		<div class = "container">
			<div class="row" align="center">
				<%
					for (ProductObj product : products) {
				%>
			<div class="col-md-4">
				<h3><%=product.getPname() %></h3>
				<p><%=product.getPdescription() %>
				<p><%=product.getPprice() %>원	
				<p><a href="" class="btn btn-secondary" role="button">상세정보 &raquo;</a>		
			</div>
			<%} %>
		</div>
		<hr>
	</div>
	
	<jsp:include page = "../footer.jsp" />
</body>
</html>
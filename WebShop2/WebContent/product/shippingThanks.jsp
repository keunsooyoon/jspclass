<%@page import="dao.ShippingDAO"%>
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
		<h1 class="display-3">주문 완료</h1>
	</div>
	
<%
	request.setCharacterEncoding("UTF-8");
	String shipping_pname = "";
	String shipping_price = "";
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
			if (n.equals("shipping_pname"))
				shipping_pname = URLDecoder.decode((thisCookie.getValue()), "utf-8");
			if (n.equals("shipping_price"))
				shipping_price = URLDecoder.decode((thisCookie.getValue()), "utf-8");
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
	
	ShippingDAO dao = new ShippingDAO();
	//pdescription = pdescription.replace("\r\n","<br/>");
	
	String cid = "333";
	String ppricetotal = "0";
	int code = dao.insert(cid, shipping_pname, shipping_price, ppricetotal, shipping_account,shipping_address);
	
	if (code == 1) {
		response.sendRedirect("/product/products.jsp");
	}else{
		response.sendRedirect("addProduct.jsp");
	}
	
	%>	
	<div class="container">
		<h2 class="alert alert-danger">주문해주셔서 대단히 감사합니다.  </h2>
	
	</div>


<%@ include file = "/footer.jsp" %>

</body>
</html>
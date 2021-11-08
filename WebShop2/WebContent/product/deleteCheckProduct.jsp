<%@page import="dao.ProductDAO"%>
<%@page import="dao.ProductObj"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

    
<%

	String a = request.getParameter("id");

	ProductDAO product = new ProductDAO();
			
	int code = product.delete(a);
	
	if (code == 1) {
		response.sendRedirect("updateProduct.jsp");
	}else{
		response.sendRedirect("updateProduct.jsp");
	}
	
%>    
    
    
    
    
    
    
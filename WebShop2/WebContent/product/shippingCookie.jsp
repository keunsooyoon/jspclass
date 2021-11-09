<%@page import="java.net.URLEncoder"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%

	request.setCharacterEncoding("UTF-8");


 	Cookie pname = new Cookie("shipping_pname", URLEncoder.encode(request.getParameter("pname"), "utf-8"));
	Cookie price = new Cookie("shipping_price", URLEncoder.encode(request.getParameter("price"), "utf-8"));
	Cookie name = new Cookie("shipping_name", URLEncoder.encode(request.getParameter("name"), "utf-8"));
	Cookie shippingdate = new Cookie("shipping_shippingdate", URLEncoder.encode(request.getParameter("shippingdate"), "utf-8"));
	Cookie account = new Cookie("shipping_account", URLEncoder.encode(request.getParameter("account"), "utf-8"));
	Cookie zipcode = new Cookie("shipping_zipcode", URLEncoder.encode(request.getParameter("zipcode"), "utf-8"));
	Cookie address = new Cookie("shipping_address", URLEncoder.encode(request.getParameter("address"), "utf-8"));

	pname.setMaxAge(365 * 24 * 60 * 60);
	price.setMaxAge(365 * 24 * 60 * 60);
	name.setMaxAge(365 * 24 * 60 * 60);
	shippingdate.setMaxAge(365 * 24 * 60 * 60);
	account.setMaxAge(365 * 24 * 60 * 60);
	zipcode.setMaxAge(365 * 24 * 60 * 60);
	address.setMaxAge(365 * 24 * 60 * 60);
	
	response.addCookie(pname);
	response.addCookie(price);
	response.addCookie(name);
	response.addCookie(shippingdate);
	response.addCookie(account);
	response.addCookie(zipcode);
	response.addCookie(address);
	
	response.sendRedirect("shippingConfirm.jsp"); 
%>
    
    
    
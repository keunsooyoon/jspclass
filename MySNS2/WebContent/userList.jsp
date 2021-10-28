<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "dao.*" %>

<% 
	ArrayList<UserObj> list = (new UserDAO()).getList();

	String str = "<table align = center>";
	str += "<tr><th colspan=3>가입자 리스트</th></tr>";
	
	for (UserObj user : list) {
		str += "<tr><td colspan=3><hr></td></tr>";
		str += "<tr><td>" + user.getId() + "</td>";
		str += "<td>" + user.getName() + "</td>";
		str += "<td>" + user.getTs() + "</td></tr>";

	}
	str += "</table>";
	out.print(str);

%>


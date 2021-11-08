<%@page import="dao.BoardDAO"%>
<%@page import="dao.BoardObj"%>
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
			<h1 class="display-3">상세보기</h1>
</div>
<%
	String a = request.getParameter("id");

	BoardObj board = (new BoardDAO()).getDetail(a);

%>
	<div class="container">
		<form name="newProduct" class="form-horizontal"  action="addCheck.jsp" method="post" enctype="multipart/form-data">
			<div class="form-group  row">
				<label class="col-sm-2 ">글제목</label>
				<div class="col-sm-4">
					<input name="title" type="text" class="form-control" value="<%=board.getTitle() %>" >
				</div>
			</div>
			<div class="form-group  row">
				<label class="col-sm-2">글내용</label>
				<div class="col-sm-4">
					<textarea name="description" rows="5" cols="20" class="form-control" ><%=board.getDescription() %></textarea>
				</div>
			</div>
			<div class="form-group  row">
				<label class="col-sm-2">사진</label>
				<div class="col-sm-4">
				<img src="/images/<%=board.getFilename()%>" style="width: 100%" />
				</div>
			</div>
			<div class="form-group  row">
				<div class="col-sm-offset-2 col-sm-10 ">
					<input type="submit" class="btn btn-primary " value="수정 하기" > 
					<input type="reset" class="btn btn-primary " value="목록 보기"  >
				</div>
			</div>
		</form>

<%@ include file = "/footer.jsp" %>

</body>
</html>
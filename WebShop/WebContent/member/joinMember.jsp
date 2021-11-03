<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<jsp:include page="/header.jsp" />
	<div class="jumbotron">
		<div class="container">
			<h1 class="display-3">회원 가입</h1>
		</div>
	</div>

	<form action="joinCheck.jsp" method="post">
		<div class="form-row">
			<div class="form-group col-md-6">
				<label for="inputEmail4">아이디</label> <input type="text"
					name="id" class="form-control" id="inputEmail4" placeholder="아이디">
			</div>
			<div class="form-group col-md-6">
				<label for="inputPassword4">암호</label> <input type="password"
					name="pass" class="form-control" id="inputPassword4" placeholder="암호">
			</div>
		</div>
		<div class="form-group">
			<label for="inputAddress">이름</label> <input type="text"
				name="name" class="form-control" id="inputAddress" placeholder="이름">
		</div>
		<div class="form-group row">
			<label class="col-sm-2">성별</label> 
			<div class="col-sm-10">
			<input type="radio" name="gender" value="남" /> 남
			<input type="radio" name="gender" value="여" />	 여
		</div>
		</div>
		<div class="form-row">
			<div class="form-group col-md-6">
				<label for="inputCity">생일</label> <input type="text"
					name="birth" class="form-control" id="inputCity">
			</div>
			</div>
			<div class="form-row">
				<div class="form-group col-md-6">
					<label for="inputCity">이메일</label> <input type="text"
						name="email" class="form-control" id="email">
				</div>
			</div>
			<div class="form-row">
				<div class="form-group col-md-6">
					<label for="inputCity">전화번호</label> <input type="text"
						name="phone" class="form-control" id="phone">
				</div>
			</div>
			<div class="form-row">
				<div class="form-group col-md-6">
					<label for="inputCity">주소</label> <input type="text"
						name="addr" class="form-control" id="address">
				</div>
			</div>

			<button type="submit" class="btn btn-primary">가입</button>
	</form>
	<jsp:include page="/footer.jsp" />
</body>
</html>
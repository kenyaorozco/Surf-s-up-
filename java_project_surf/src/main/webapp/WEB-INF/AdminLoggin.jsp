<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!-- c:out ; c:forEach etc. -->
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!-- Formatting (dates) -->
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!-- form:form -->
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!-- for rendering errors on PUT routes -->
<%@ page isErrorPage="true"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Admin Loggin</title>
<link rel="stylesheet" href="/webjars/bootstrap/css/bootstrap.min.css">
<link rel="stylesheet" href="/css/main.css">
<!-- change to match your file/naming structure -->
<script src="/webjars/jquery/jquery.min.js"></script>
<script src="/webjars/bootstrap/js/bootstrap.min.js"></script>
</head>
<body class="bg-dark">
	<div class="  admin-box">
		<div class="container px-4 text-center">
			<div class="row mx-auto">
				<div class="col">
					<div class="p-3">
						<img alt="admin" src="/images/userImage.png" width="150" class="bg-white rounded-circle">
						<h2 class="text-center">Admin loggin</h2>

					</div>
				</div>
			</div>
		</div>
		<div class="login-reg-main border-round">
			<form:form action="/loginAdmin" method="post"
				modelAttribute="newLogin">
				<div class="form-group">
					<label>Email:</label>
					<form:input path="email" class="form-control" />
					<form:errors path="email" class="text-danger" />
				</div>
				<div class="form-group">
					<label>Password:</label>
					<form:password path="password" class="form-control" />
					<form:errors path="password" class="text-danger" />
				</div>
				<input type="submit" value="Login" id="submitAdmin" />
			</form:form>
		</div>

	</div>
<button class="btn btn-white" >
			<a href="/home" class="text-decoration-none text-white">Return Home</a>
			</button>
</body>
</html>
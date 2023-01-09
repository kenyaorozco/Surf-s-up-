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
<title></title>
<link rel="stylesheet" href="/webjars/bootstrap/css/bootstrap.min.css">
<link rel="stylesheet" href="/css/main.css">
<!-- change to match your file/naming structure -->
<script src="/webjars/jquery/jquery.min.js"></script>
<script src="/webjars/bootstrap/js/bootstrap.min.js"></script>
</head>
<body class="customer-Register">
	<div class="customer-box">
		<h2 class="text-center">Register an Account</h2>
		<form:form action="/register/customer" method="post"
			modelAttribute="newShopper">

			<div class="register-box">
				<form:errors path="userName" class="text-danger fw-lighter fs-6" />
				<form:input path="userName" type="text" />


				<label>Username</label>
			</div>
			<div class="register-box">
				<form:errors path="email" class="text-danger fw-lighter fs-6" />
				<form:input path="email" type="text" />
				<label>Email</label>
			</div>
			<div class="register-box">
				<form:errors path="password" class="text-danger fw-lighter fs-6" />
				<form:input path="password" type="password" />



				<label>Password</label>
			</div>
			<div class="register-box">
				<form:errors path="confirm" class="text-danger fw-lighter fs-6" />
				<form:input path="confirm" type="password" />

				<label>Confirm Password</label>
			</div>


			<div class="button-form">
				
				<button id="submit">
					 Submit
				</button>
			</div>

		</form:form>
		</div>
		<button class="btn btn-white " >
			<a href="/customer" class="text-decoration-none text-white">Return</a>
			</button>
    <div>
	</div>
</body>
</html>
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
<title>Cart</title>
<link rel="stylesheet" href="/webjars/bootstrap/css/bootstrap.min.css">
<link rel="stylesheet" href="/css/main.css">
<!-- change to match your file/naming structure -->
<script src="/webjars/jquery/jquery.min.js"></script>
<script src="/webjars/bootstrap/js/bootstrap.min.js"></script>
</head>
<body>
<body >
	<nav class="navbar bg-white ">
		<div class="container-fluid  ">
			<button class="navbar-toggler " type="button">

				<img alt="companyLogo" src="/images/surfLogo.png" width="75">
			</button>
			<div>
			
				<button type="button" class="btn btn-info ">
					<a href="/login" class="text-decoration-none text-white">login</a>
				</button>
			</div>
	</div>
	</nav>
<h2 class="text-center">Whoops nothing is in your bag yet! </h2>
</body>
</html>
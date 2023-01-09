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
<title>Search a beach</title>
<link rel="stylesheet" href="/webjars/bootstrap/css/bootstrap.min.css">
<link rel="stylesheet" href="/css/main.css">
<script src="/webjars/jquery/jquery.min.js"></script>
<script src="/webjars/bootstrap/js/bootstrap.min.js"></script>
</head>
<body>

	<nav class="navbar navbar-expand-lg bg-white">
		<div class="container-fluid">
		<a href="/home">
			<img alt="companyLogo" src="/images/surfLogo.png" width="75" >
		</a>

			<div class="">
				<button type="button" class="btn btn-light">
					<a href="/login">login</a>
				</button>
			</div>
		</div>
	</nav>
	
<script src="https://unpkg.com/@lottiefiles/lottie-player@latest/dist/lottie-player.js"></script>
<lottie-player src="https://assets5.lottiefiles.com/private_files/lf30_y9czxcb9.json" class="mx-auto" background="transparent"  speed="1"  style="width: 500px; height: 500px;"  loop  autoplay></lottie-player>
</html>
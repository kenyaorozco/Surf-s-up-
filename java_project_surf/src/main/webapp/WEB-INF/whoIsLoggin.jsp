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
<title>What type of user</title>
<link rel="stylesheet" href="/webjars/bootstrap/css/bootstrap.min.css">
<link rel="stylesheet" href="/css/main.css">
<!-- change to match your file/naming structure -->
<script src="/webjars/jquery/jquery.min.js"></script>
<script src="/webjars/bootstrap/js/bootstrap.min.js"></script>
</head>
<body>
	<section>
		<h2 class="text-center text-white">What type of user are you?</h2>

		
			<div class="container px-5 text-center mx-auto">
				<div class="row  mx-auto">
					<div class="col">
						<div class="p-3 ">
							<img alt="shopper" src="/images/blueBag.png" width="150">
							<div class="text-center">
								<h3>
									<a href="/customer" class="text-white text-decoration-none ">Shopper</a>
								</h3>
							</div>
						</div>
					</div>
					<div class="col">
						<div class="p-3">
							<img alt="shopper" src="/images/userImage.png" width="150"
								class="bg-white rounded-circle">
							<h3>
								<a href="/employee" class="text-white text-decoration-none ">Admin</a>
							</h3>
						</div>
					</div>
					<button class="btn btn-white ">
						<a href="/home" class="text-decoration-none text-white">return
							home</a>
					</button>
				</div>
			</div>
			<div class="wave wave1"></div>
			<div class="wave wave2"></div>
			<div class="wave wave3"></div>
			<div class="wave wave4"></div>
	</section>
</body>
</html>
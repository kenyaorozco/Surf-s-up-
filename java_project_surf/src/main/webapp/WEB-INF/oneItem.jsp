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
<title>Product view</title>
<link rel="stylesheet" href="/webjars/bootstrap/css/bootstrap.min.css">
<link rel="stylesheet" href="/css/main.css">
<!-- change to match your file/naming structure -->
<script src="/webjars/jquery/jquery.min.js"></script>
<script src="/webjars/bootstrap/js/bootstrap.min.js"></script>
</head>
<body>
	<nav class="navbar bg-white ">
		<div class="container-fluid  ">
			<button class="navbar-toggler " type="button">
				<a href="/home"> <img alt="companyLogo"
					src="/images/surfLogo.png" width="75">
				</a>
			</button>
			<div>
				<button class="bg-transparent border border-0">
					<a href="/cart"> <img alt="bagIcon" src="images/blueBag.png"
						width="35">
					</a>
				</button>
				<button type="button" class="btn btn-info ">
					<a href="/login" class="text-decoration-none text-white">login</a>
				</button>
			</div>
		</div>
	</nav>





	<main class="container">
		<!-- Left Column /  Image -->
		<div class="left-column">
			<img data-image="" src="${product.image }" alt="">
		</div>
		<!-- Right Column -->
		<div class="right-column">
			<!-- Product Description -->
			<div class="product-description">
				<h1>${product.productName}</h1>
				<p>${product.description }</p>
			</div>
			<!-- Product Configuration -->
			<div class="product-configuration">
				<!-- Size Configuration -->
				<div class="cable-config">
					<span>Size</span>

					<div class="cable-choose">
						<button>Small</button>
						<button>Medium</button>
						<button>Large</button>

					</div>
				</div>
			</div>

			<!-- Product Pricing -->
			<div class="product-price">
				<span>$ ${product.price }</span> <a href="#" class="cart-btn">Add
					to cart</a>
			</div>
		</div>
	</main>
</body>
</html>
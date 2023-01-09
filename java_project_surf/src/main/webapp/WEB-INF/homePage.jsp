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
<title>Home page</title>
<link rel="stylesheet" href="/webjars/bootstrap/css/bootstrap.min.css">
<link rel="stylesheet" href="/css/main.css">
<!-- change to match your file/naming structure -->
<script src="/webjars/jquery/jquery.min.js"></script>
<script src="/webjars/bootstrap/js/bootstrap.min.js"></script>
</head>
<body>


	<nav class="navbar bg-white ">
		<div class="container-fluid  ">
			<button class="navbar-toggler " type="button"
				data-bs-toggle="offcanvas" data-bs-target="#offcanvasNavbar"
				aria-controls="offcanvasNavbar">

				<img alt="companyLogo" src="/images/surfLogo.png" width="75">
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

			<div class="offcanvas offcanvas-start bg-white" tabindex="0"
				id="offcanvasNavbar" aria-labelledby="offcanvasNavbarLabel">
				<div class="offcanvas-header bg-white">
					<h5 class="offcanvas-title" id="offcanvasNavbarLabel">
						Surf's Up<img alt="companyLogo" src="/images/surfLogo.png"
							width="25">
					</h5>
					<button type="button" class="btn-close" data-bs-dismiss="offcanvas"
						aria-label="Close"></button>
				</div>
				<div class="offcanvas-body">
					<ul class="navbar-nav justify-content-end flex-grow-1 pe-3">
						<li class="nav-item"><a class="nav-link active"
							aria-current="page" href="#">Home</a></li>
						<li class="nav-item"><a class="nav-link" href="/beach">Find
								your local Beach</a></li>
						<li class="nav-item dropdown"><a
							class="nav-link dropdown-toggle" href="#" role="button"
							data-bs-toggle="dropdown" aria-expanded="false"> Clothes </a>
							<ul class="dropdown-menu">
								<li><a class="dropdown-item" href="#">T-shirts</a></li>
								<li><a class="dropdown-item" href="#">Shorts</a></li>
								<li><a class="dropdown-item" href="#">Boards</a></li>


							</ul></li>
					</ul>
					<form class="d-flex mt-3" role="search">
						<input class="form-control me-2" type="search"
							placeholder="Search for items" aria-label="Search">
						<button class="btn btn-outline-success" type="submit">Search</button>
					</form>
				</div>
			</div>
		</div>
	</nav>

	<div id="carouselExampleControls" class="carousel slide"
		data-bs-ride="carousel">
		<div class="carousel-inner">
			<div class="carousel-item active">
				<img
					src="https://www.stokedfortravel.com/wp-content/uploads/2019/08/top-surf-destinations-2020-travel-australia-indonesia-south-africa-mozambique-maldives-philippine-stoked-for-travel.jpg"
					style="height: 400px" class="d-block w-100" alt="...">
			</div>
			<div class="carousel-item">
				<img
					src="https://tahititourisme.com/wp-content/uploads/2019/07/Tom-Servais-Tahiti-Surf-Pro-2017servais17_0332781140x550px.jpg"
					style="height: 400px" class="d-block w-100" alt="...">
			</div>
			<div class="carousel-item">
				<img
					src="https://images.unsplash.com/photo-1586996292898-71f4036c4e07?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MXx8aGF3YWlpJTIwc3VyZnxlbnwwfHwwfHw%3D&w=1000&q=80"
					style="height: 400px" class="d-block w-100" alt="...">
			</div>
		</div>
		<button class="carousel-control-prev" type="button"
			data-bs-target="#carouselExampleControls" data-bs-slide="prev">
			<span class="carousel-control-prev-icon" aria-hidden="true"></span> <span
				class="visually-hidden">Previous</span>
		</button>
		<button class="carousel-control-next" type="button"
			data-bs-target="#carouselExampleControls" data-bs-slide="next">
			<span class="carousel-control-next-icon" aria-hidden="true"></span> <span
				class="visually-hidden">Next</span>
		</button>
	</div>
	<h2 class="text-center">~~~~~~~ Products ~~~~~~~~</h2>
	<div class="homePageProducts">
		<div id="topBump">
			<c:forEach items="${allProducts }" var="info">
				<div class="holdProduct">
					<div class="product ">

						<img alt="productImage" src="${info.image}" width="100px"
							height="125px">
					</div>
					<div class="productNames card-body">
						<div class="d-flex justify-content-between flex-column">
							<div>
								<p class="text-start fw-light">

									<a href="/item/${info.id}"
										class="text-decoration-none text-info">
										${info.productName} </a>
								</p>
							</div>
							<div class="priceBox fw-lighter card-text d-flex flex-column justify-content-end">
								<p class="text-start align-text-bottom">Price:$ ${info.price}</p>
							</div>
						</div>
					</div>

				</div>
			</c:forEach>
		</div>

	</div>
</body>
</html>
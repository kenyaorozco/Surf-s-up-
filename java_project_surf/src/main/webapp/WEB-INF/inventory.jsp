<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!-- c:out ; c:forEach etc. --> 
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!-- Formatting (dates) --> 
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!-- form:form -->
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!-- for rendering errors on PUT routes -->
<%@ page isErrorPage="true" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Inventory</title>
    <link rel="stylesheet" href="/webjars/bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet" href="/css/main.css"> <!-- change to match your file/naming structure -->
    <script src="/webjars/jquery/jquery.min.js"></script>
    <script src="/webjars/bootstrap/js/bootstrap.min.js"></script>
</head>
<body>
   <nav class="navbar navbar-dark bg-dark">
		<h3 class="text-white">
			Welcome,
			<c:out value="${admin.userName}"></c:out>
			!
		</h3>
		<p><a href="/logout">logout</a></p>
	</nav>
	<div class="navbar">
		<p>Inventory</p>
		<p>	<a href="/createProduct">+ Create a product</a></p>

		<a href="/admin" class="btn btn-success">Register a new Employee</a>
	
	</div>
	<table class="table">
		<thead>
			<tr>
				<th scope="col">Image</th>
				<th scope="col">Product Name</th>
				<th scope="col"> Price</th>
				<th scope="col">Action</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach items="${allProducts }" var="info">
				<tr>
					<td><img src="${info.image }" width="50"></td>
					<td><a href="/display/${info.id}">${info.productName}
					</a></td>
					<td>${info.price }</td>
						<td>
					<a href="/edit/${info.id }"> edit</a>
				</td>
				<td>
					<form action="/product/${info.id}" method="post">
						<input type="hidden" name="_method" value="delete"> <input
							type="submit" value="Delete">
					</form>
				</td>
				</tr>
			</c:forEach>
			

		</tbody>
	</table>
</body>
</html>
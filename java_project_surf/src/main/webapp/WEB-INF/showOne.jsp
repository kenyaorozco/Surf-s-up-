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
    <title>Tacos</title>
    <link rel="stylesheet" href="/webjars/bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet" href="/css/main.css"> <!-- change to match your file/naming structure -->
    <script src="/webjars/jquery/jquery.min.js"></script>
    <script src="/webjars/bootstrap/js/bootstrap.min.js"></script>
</head>
<body>
<h2> Product Details</h2> <a href="/inventory">go Back</a>

   <form:form action="/display/${product.id }" method="post" modelAttribute="product">
			<p>
				<form:label path="image">Image URL:</form:label>
				<form:errors path="image" />
				<form:input path="image" />
			</p>
			<p>
				<form:label path="productName">Product Name: </form:label>
				<form:errors path="productName" />
				<form:input path="productName" />
			</p>
			<p>
				<form:label path="price">Amount: </form:label>
				<form:errors path="price" />
				<form:input type="number" path="price" />
			</p>
			<p>
				<form:label path="description">Description </form:label>
				<form:errors path="description" />
				<form:textarea path="description" />
			</p>
		</form:form>
</body>
</html>
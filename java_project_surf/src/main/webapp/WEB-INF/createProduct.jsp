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
<title>New Product</title>
<link rel="stylesheet" href="/webjars/bootstrap/css/bootstrap.min.css">
<link rel="stylesheet" href="/css/main.css">
<!-- change to match your file/naming structure -->
<script src="/webjars/jquery/jquery.min.js"></script>
<script src="/webjars/bootstrap/js/bootstrap.min.js"></script>
</head>
<body>

	<div class="container text-center">
	<h3 class="text-center">create a new product</h3>

		<form:form action="/newProduct" method="post" modelAttribute="product">
			<form:input type="hidden" path="admin" value="${admin_id}" />
			<form:errors style="color: red;" path="*" />
			<div class="mb-3">
				<form:label path="productName">Product Name:</form:label>
				<form:input path="productName" />
			</div>
			<div class="mb-3">
				<form:label path="price">Price </form:label>
				<form:input path="price" type="number" />

			</div>
			<div class="mb-3">
				<form:label path="image">Image: </form:label>
				<form:input path="image" />
			</div>
		
			<div class="mb-3">
				<form:label path="description">Product Description: </form:label>
				<form:textarea path="description" />
			</div>
		
			<button type="button" class="btn btn-danger">
				<a href="/inventory" class="text-white text-decoration-none">Cancel</a>
			</button>

			<button type="submit" class="btn btn-primary">Submit</button>
		</form:form>


	</div>
</body>

</body>
</html>
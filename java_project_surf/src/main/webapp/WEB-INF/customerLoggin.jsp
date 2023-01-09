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
    <title>Customer</title>
    <link rel="stylesheet" href="/webjars/bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet" href="/css/main.css"> 
    <script src="/webjars/jquery/jquery.min.js"></script>
    <script src="/webjars/bootstrap/js/bootstrap.min.js"></script>
</head>
<body class=" customer-Login">
 	
	<div class="login-box">
        <h2>Customer Login</h2>
        <form:form action="/login" method="post" modelAttribute="newLogin">
            <div class="user-box">
                <form:input path="email"/>
               <form:errors path="email" class="text-danger" />
                
                <label>Email</label>
            </div>
            <div class="user-box">
					<form:password path="password"  />
										<form:errors path="password" class="text-danger" />
					
                <label>Password</label>
            </div>

            <div class="button-form">

                	<button id="submit">
					 Submit
				</button>

                <div id="register">
                    Don't have an account ?
                    <a href="/register">
                        Register
                    </a>
                </div>

            </div>

        </form:form>
    </div><button class="btn btn-white " >
			<a href="/login" class="text-decoration-none text-white">Return</a>
			</button>
    <div>
    <script src="https://unpkg.com/@lottiefiles/lottie-player@latest/dist/lottie-player.js"></script>
<lottie-player class="rightTree" src="https://assets2.lottiefiles.com/packages/lf20_k2judan0.json"  background="transparent"  speed="1"  style="width: 300px; height: 300px;" hover   autoplay></lottie-player>
<script src="https://unpkg.com/@lottiefiles/lottie-player@latest/dist/lottie-player.js"></script>
<lottie-player class="leftTree" src="https://assets2.lottiefiles.com/packages/lf20_gghrwxyu.json"  background="transparent"  speed="1"  style="width: 300px; height: 300px;" hover loop  autoplay></lottie-player>
    </div>
   
</body>
</html>
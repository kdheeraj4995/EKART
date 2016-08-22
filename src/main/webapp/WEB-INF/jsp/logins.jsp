<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Login</title>
<link href="<c:url value="/resources/css/stylee.css" />" rel="stylesheet">
</head>
<body style="padding-top:75px">
	<div class="container">
		<section id="content">
			<form action="perform_login" method="post">
				<h1>Login Form</h1>
				<div>
					<input type="text" placeholder="Username" required id="username" name="username" 
						pattern=".{5,10}" title="minimum length for name is 5"/>
				</div>
				<div>
					<input type="password" placeholder="Password" required id="password" name="password" 
					title="Enter Valid credentials"/>
				</div>
				<div>
					<input type="submit" value="Log in" /> <a href="#">Lost your
						password?</a> <a href="Register">Register</a>
				</div>
				
			</form>
			<!-- form -->
			<div class="button">
				<a href="Register">Get New Account</a>
			</div>
			<!-- button -->
		</section>
		<!-- content -->
	</div>
	<!-- container -->
</body>
</html>

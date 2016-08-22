<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Login</title>
<link href="<c:url value="/resources/css/register.css" />"
	rel="stylesheet">
</head>
<body style="padding-top: 75px">
	<div class="container">
		<section id="content">
			<c:url var="addAction" value="adduser"></c:url>
			<form:form action="${addAction}" commandName="userDetails"
				method="post">
				<h1>Registration</h1>
				<div>
					<form:input path="name" type="text" placeholder="Name"
						pattern=".{5,10}" required="true" id="username" name="username" 
						title="minimum length for name is 5"/>
				</div>
				<div>
					<form:input path="userName" type="text" placeholder="Username"
					pattern=".{5,10}" required="true" id="username" name="username"
					title="minimum length for username is 5" />
				</div>
				<div>
					<form:input path="password" type="password" placeholder="Password"
						required="true" id="password" name="password" />
				</div>
				<div>
					<form:input path="email" type="email" placeholder="Email"
						required="true" id="username" name="username" />
				</div>
				<div>
					<form:input path="mobile" type="text" placeholder="Mobile"
						pattern="^[789]\d{9}$" required="true" id="username"
						name="username" title="Enter valid mobile number" />
				</div>
				<div>
					<input type="submit" value="Register" /> <a href="#">Lost your
						password?</a> <a href="login">Sign In</a>
				</div>

			</form:form>
			<!-- form -->
		</section>
		<!-- content -->
	</div>
	<!-- container -->
</body>
</html>

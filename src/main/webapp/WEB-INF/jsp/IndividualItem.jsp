<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<link href="<c:url value="/resources/css/IndividualItem.css" />"
	rel="stylesheet">
<link href="<c:url value="/resources/css/font-awesome.min.css" />"
	rel="stylesheet">
</head>
<body style="padding-top: 80px">

	<div class="container">
		<c:forEach items="${IndividualProduct}" var="product">
			<div class="col-xs-6 w3-animate-left">
				<div class="img">
					<img height="192px"
						width="192px" alt="${product.id}"
						src="/EKART/imageDisplay/${product.id}">
					<div class="desc">
						<strong>${product.name}</strong>
					</div>
				</div>
			</div>

			<div class="col-xs-6 w3-animate-right">
				<div class="img">
					<div class="desc">
						<p>
						<div class="form-group">
							<input
								type="text" class="form-control" value="${product.name}"
								readonly="readonly">
						</div>
						
						<div class="form-group">
							 <input type="text"
								class="form-control" value="Rs. ${product.price}"
								readonly="readonly">
						</div>
						
						<div class="form-group">
							<input type="text" class="form-control btn-block"
								value="${product.description}" readonly="readonly">
						</div>

						<c:choose>
								<c:when test="${LoggedIn}">
									<form action="${pageContext.request.contextPath}/addtoCart/${userId}/${product.id}">
										<input type="number" value="1" name="quantity"
											class=" form-control  btn-block  "> 
											<br>
										<input
											type="submit" value="Add to Cart"
											class="btn btn-xs btn-success btn-block">
									</form>
								</c:when>
							</c:choose>




					</div>
				</div>
			</div>


		</c:forEach>
	</div>

</body>
</html>
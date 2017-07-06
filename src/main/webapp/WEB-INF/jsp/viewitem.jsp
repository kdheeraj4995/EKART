<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<link href="<c:url value="/resources/css/itempage.css" />"
	rel="stylesheet">

</head>
<body style="padding-top: 60px">
	<!-- <div class="container"> -->
	<%-- <c:forEach items="${productList}" var="product">
								<div class="col-xs-2 ">
									<div class="thumbnail">
										<img height="192px" width="192px" alt="${product.id}"
											src="<c:url value="/resources/images/product/${product.id}.jpg"></c:url>">
										<div class="desc">
											<p>
												${product.name}
												<c:choose>
													<c:when test="${LoggedIn}">
														<form action="addtoCart/${userId}/${product.id}">
															<input type="number" value="1" name="quantity"
																class="btn btn-xs btn-primary   col-xs-6 "> <input
																type="submit" value="Add"
																class="btn btn-xs col-xs-6 btn-primary">
														</form>
													</c:when>
												</c:choose>
											</p>

										</div>
									</div>
								</div>
							</c:forEach>
							</div>
							 --%>
	<div class="container">
		<c:forEach items="${productList}" var="product">
			<div class="col-xs-3 w3-animate-zoom">
				<div class="img">
					<a href="${pageContext.request.contextPath}/IndividualItem/${product.id}"> <img height="192px"
						width="192px" alt="${product.id}"
						src="/EKART/imageDisplay/${product.id}">
					</a>

					<%-- <img height="192px" width="192px"  alt="${product.id}"
						src="<c:url value="/resources/images/product/${product.id}.jpg"></c:url>"></a> --%>
					<div class="desc">
						<p>

							${product.name}<br> <i class="fa fa-inr" aria-hidden="true"></i>
							${product.price}
							<c:choose>
								<c:when test="${LoggedIn}">
									<form action="${pageContext.request.contextPath}/addtoCart/${userId}/${product.id}">
										<input type="number" value="1" name="quantity"
											class=" form-control  btn-block  "> <input
											type="submit" value="Add to Cart"
											class="btn btn-xs btn-success btn-block">

									</form>
								</c:when>
							</c:choose>
						</p>

					</div>
				</div>
			</div>
		</c:forEach>
	</div>



</body>
</html>
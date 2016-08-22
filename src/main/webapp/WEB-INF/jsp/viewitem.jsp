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
</head>
<body style="padding-top: 100px">
Hello
<c:forEach items="${productList}" var="product">
								<div class="col-xs-2 ">
									<div class="thumbnail">
										<img height="150px" width="150px" alt="${product.id}"
											src="<c:url value="/WEB-INF/resources/images/${product.id}.jpg"></c:url>">
										<div class="caption">
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

								<%-- <li><a href=" ${product.id}" class="w3-hover-none">${product.name}</a></li>
								<li><img alt="Image"
									src="<c:url value="/WEB-INF/resources/images/product/${product.id}.jpg"></c:url>"></li>
								
								<c:choose>
									<c:when test="${LoggedIn}">
											<li><a href="addtoCart/${userId}/${product.id}"
						class="w3-hover-none">Add to Cart</a></li>
										<li>
											<form action="addtoCart/${userId}/${product.id}">
												<input type="number" value="1" name="quantity"> <input
													type="submit" value="Add to Cart">
											</form>
										</li>
									</c:when>
								</c:choose> --%>
							</c:forEach>
</body>
</html>
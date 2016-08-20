<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<link href="<c:url value="/resources/css/cart.css" />" rel="stylesheet">

<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
</head>
<body style="padding-top:100px">
<div id="cart">
<div class="container">
	<div class="row">
	<div class="col-xs-2"></div>
		<div class="col-xs-8">
			<div class="panel panel-primary">
				<div class="panel-heading">
					<div class="panel-title">
						<div class="row">
							<div class="col-xs-6">
								<h5><span class="glyphicon glyphicon-shopping-cart"></span> Shopping Cart</h5>
							</div>
						</div>
					</div>
				</div>
				<div class="panel-body">
				
				<div class="row">
						<div class="col-xs-4">
						<label class="form-control input-sm">Product Name</label>
						</div>
						<!-- <div class="col-xs-2">
						<label class="form-control input-sm">Quantity</label>
						</div> -->
						<div class="col-xs-3 text-right">
						<label class="form-control input-sm" > Total Price</label>
						</div>
								
						<div class="col-xs-4">
						<div class="col-xs-6"><label class="form-control input-sm">Quantity</label></div>
						<div class="col-xs-6"> <label class="form-control input-sm">Update</label></div>
						</div>
						<div class="col-xs-1">
								<a href="#" class="form-control input-sm"><span class="glyphicon glyphicon-trash"> </span></a>
							</div>	
					</div>
					<hr>
				<c:if test="${!empty CartList}">
				<c:forEach items="${CartList}" var="cart">
					<div class="row">
						<div class="col-xs-4">
						<label class="form-control input-sm">${cart.productname}</label>
						</div>
						<%-- <div class="col-xs-2">
								<input type="text" class="form-control input-sm" value="${cart.quantity}">
						</div> --%>
						<div class="col-xs-3 text-right">
						<label class="form-control input-sm">${cart.price}</label>
						</div>
								
						<div class="col-xs-4">
						<form action="editorder/${cart.id}">
						<div class="col-xs-6"><input type="text" class="form-control input-sm" value="${cart.quantity}" name="quantity"></div>
						<div class="col-xs-6"><button type="submit" class="btn btn-default btn-sm btn-block">Update cart
						</button></div>
						
						</form>
						</div>
						<div class="col-xs-1">
								<a href="deleteitem/${cart.id}" class="form-control input-sm"><span class="glyphicon glyphicon-trash"> </span></a>
						</div>
							
					</div>
					
					</c:forEach>
				</c:if>
					
				
				</div>
				<div class="panel-footer">
					<div class="row text-center">
						<div class="col-xs-3">
							<a href="Welcomepage" class="btn btn-primary btn-sm btn-block">Continue Shopping</a></div>
						<div class="col-xs-6">
							<h4 class="text-right">Total : Rs ${CartPrice}</h4>
						</div>
						<form action="placeorder">
						<div  class="col-xs-3">
							<button type="submit" class="btn btn-success btn-block">
								Checkout
							</button>
						</div>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
</div>
<!--  -->

</body>
</html>
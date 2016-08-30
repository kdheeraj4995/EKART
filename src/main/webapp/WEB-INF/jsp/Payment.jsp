<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Payment</title>
<link href="<c:url value="/resources/css/credit.css" />" rel="stylesheet">
</head>
<body  style="padding-top: 75px">

<div class="container">
		<div class="row col-xs-4"></div>
		<div class="col-xs-4">
     <!-- CREDIT CARD FORM STARTS HERE -->
				<div class="panel panel-primary">
					<div class="panel-heading">
						<div class="row">
							<h3 class="panel-title " style="padding-left: 20px">Payment Details</h3>
							
						</div>
					</div>
					<div class="panel-body">
						<form action="pay" method="post">
							<div class="row">
								<div class="col-xs-12">
									<div class="form-group">
										<label for="cardNumber">Card Number</label>
										<div class="form-group">
											<input type="text" class="form-control input-sm" name="cardNumber"
												placeholder="Valid Card Number" pattern="^[123456789]\d{15}$"
												title="Enter valid 16 digit number"
												required /> 
										</div>
									</div>
								</div>
							</div>
							<div class="row">
								<div class="col-xs-7 col-md-7">
									<div class="form-group">
										<label for="cardExpiry"><span class="hidden-xs">Expiration</span><span
											class="visible-xs-inline">EXP</span> DATE</label> <input type="tel"
											class="form-control input-sm" name="cardExpiry" placeholder="MM / YY"
											 required />
									</div>
								</div>
								<div class="col-xs-5 col-md-5 pull-right">
									<div class="form-group">
										<label for="cardCVC">CVV Code</label> <input type="text" pattern="^[123456789]\d{2}$"  size="3"
											class="form-control input-sm" name="cardCVC" placeholder="CVV"
											required />
									</div>
								</div>
							</div>
							<div class="row">
								<div class="col-xs-12">
									<div class="form-group">
										<label for="couponCode">Coupon Code</label> <input type="text"
											class="form-control input-sm" name="couponCode" />
									</div>
								</div>
							</div>
							
							<div class="row">
								<div class="col-xs-12">
								
									<button class="btn btn-success btn-sm btn-block" type="submit">Make Payment</button>		
								
								</div>
							</div>
						</form>
					</div>
				</div>
				<!-- CREDIT CARD FORM ENDS HERE -->
</div>
     
</div> 
</body>
</html>
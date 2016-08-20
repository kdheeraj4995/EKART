<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>EKART Admin</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link href="<c:url value="/resources/css/bootstrap.min.css" />" rel="stylesheet">
<link href="<c:url value="/resources/css/bootstrap-theme.min.css" />" rel="stylesheet">
<link href="<c:url value="/resources/css/w3.css" />" rel="stylesheet">
<link href="<c:url value="/resources/css/font-awesome.min.css" />" rel="stylesheet">
<script type="text/javascript" src="<c:url value="/resources/js/bootstrap.min.js"></c:url>"></script>

</head>
<body>
	<nav>
		<ul class="w3-navbar w3-card-4 w3-light-grey w3-left-align w3-top">
			<li class="w3-hide-medium w3-hide-large w3-black w3-opennav w3-right">
				<a href="javascript:void(0);" onclick="myFunction()"><i
					class="fa fa-caret-square-o-down" aria-hidden="true"></i></a></li>
			<li><a class="w3-cyan " href="#"><i class="fa fa-home"></i>
					E K A R T </a></li>
			<li class="w3-hide-small"><a href="admin/product"
				style="display: inline-block"><i class="fa fa-list"
					aria-hidden="true"></i> Products</a></li>
			<li class="w3-hide-small"><a href="admin/category"
				style="display: inline-block"><i class="fa fa-list"
					aria-hidden="true"></i> Category</a></li>
			<li class="w3-hide-small"><a href="admin/supplier"
				style="display: inline-block"><i class="fa fa-list"
					aria-hidden="true"></i> Supplier</a></li>
			<li class="w3-hide-small" style="float: right"><a href="#"><i
					class="fa fa-sign-out"></i> Sign Out</a></li>	
		</ul>
		<div id="demo" class="w3-hide w3-card-8 w3-hide-large w3-hide-medium">
			<ul class="w3-navbar w3-left-align w3-card-8 w3-light-grey">
				<li><a href="product" style="display: inline-block"><i
						class="fa fa-list" aria-hidden="true"></i> Products</a></li>
				<li><a href="category" style="display: inline-block"><i
						class="fa fa-list" aria-hidden="true"></i> Category</a></li>
				<li><a href="supplier" style="display: inline-block"><i
						class="fa fa-list" aria-hidden="true"></i> Supplier</a></li>
				<li style="float: right"><a href="#"><i
						class="fa fa-sign-out"></i> Sign Out</a></li>
			</ul>
		</div>
	</nav>
	<div style="margin-top:48px">
		<c:choose>
			<c:when test="${ProductPageClicked}">
				<c:import url="/WEB-INF/jsp/AdminProductPage.jsp"></c:import>
			</c:when>
		</c:choose>
		<c:choose>
			<c:when test="${CategoryPageClicked}">
				<c:import url="/WEB-INF/jsp/AdminCategoryPage.jsp"></c:import>
			</c:when>
		</c:choose>
		<c:choose>
			<c:when test="${SupplierPageClicked}">
				<c:import url="/WEB-INF/jsp/AdminSupplierPage.jsp"></c:import>
			</c:when>
		</c:choose>
	</div>
	

</body>
</html>
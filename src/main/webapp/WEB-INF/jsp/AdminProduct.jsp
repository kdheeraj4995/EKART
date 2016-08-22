<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Category</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link href="<c:url value="/resources/css/w3.css" />" rel="stylesheet">
<link href="<c:url value="/resources/css/background.css" />"
	rel="stylesheet">
<link href="<c:url value="/resources/css/font-awesome.min.css" />"
	rel="stylesheet">
<script>
	var app = angular.module('myApp', []);
	function MyController($scope, $http) {
		$scope.sortType = 'name'; // set the default sort type
		$scope.sortReverse = false; // set the default sort order
		$scope.search ='';
		$scope.getDataFromServer = function() {
			$http({
				method : 'GET',
				url : 'productgson'
			}).success(function(data, status, headers, config) {
				$scope.products = data;// alert(data); 
			}).error(function(data, status, headers, config) {
			});
		};
	};
</script>
</head>
<body style="padding-top: 75px">

	<div class="container row">
		<div class="col-sm-3">
		</div>
		<div class="col-sm-6">
			<c:url var="addAction" value="addproduct"></c:url>
			<form:form action="${addAction}" commandName="product">


				<table>
					<tr>
						<td><form:label class="btn btn-default btn-block" path="id">
								<spring:message text="Id" />
							</form:label></td>
						<c:choose>
							<c:when test="${!empty product.id}">
								<td><form:input class="form-control" path="id"
										readonly="true" /></td>
							</c:when>
							<c:otherwise>
								<td><form:input class="form-control" path="id"
										pattern=".{2,10}" required="true"
										title="id should contains 2 to 10 characters" /></td>
							</c:otherwise>
						</c:choose>
					<tr>
						<td><form:label class="btn btn-default btn-block" path="name">
								<spring:message text="Name" />
							</form:label></td>
						<td><form:input class="form-control" path="name"
								required="true" /></td>
					</tr>
					<tr>
						<td><form:label class="btn btn-default btn-block" path="description">
								<spring:message text="Description" />
							</form:label></td>
						<td><form:input class="form-control" path="description"
								required="true" /></td>
					</tr>
					<tr>
						<td><form:label class="btn btn-default btn-block" path="price">
								<spring:message text="Price" />
							</form:label></td>
						<td><form:input type="number" class="form-control" path="price"
								required="true" /></td>
					</tr>
					<tr>
							<td><form:label class="btn btn-default btn-block" path="supplierid">
									<spring:message text="Supplier" />
								</form:label></td>
							<td><form:select path="supplierid" class="form-control" required="true">
							<c:forEach items="${supplierList}" var="supplier">
								<form:option class="form-control" value="${supplier.id}">${supplier.name}</form:option>
							</c:forEach>
								</form:select></td>
						</tr>
						<tr>
							<td><form:label class="btn btn-default btn-block" path="categoryid">
									<spring:message text="Category" />
								</form:label></td>
							<td><form:select class="form-control" path="categoryid" required="true">
							<c:forEach items="${categoryList}" var="category">
								<form:option class="form-control" value="${category.id}">${category.name}</form:option>
							</c:forEach>
								</form:select></td>
						</tr>
						<tr>
							<td><form:label class="btn btn-default btn-block" path="image">
									<spring:message text="Image" />
								</form:label></td>
							<td><form:input type="file" class=" btn btn-default btn-block form-control" path="image" required="true" /></td>
						</tr>
						<tr>
				</table>
				<br>
				<c:if test="${!empty category.name}">
					<input class="btn btn-block btn-primary" type="submit"
						value="Edit Product" />
				</c:if>
				<c:if test="${empty category.name}">
					<input class="btn btn-block btn-primary" type="submit"
						value="Add Product" />
				</c:if>
			</form:form>
		</div>
		<div class="col-sm-3"></div>
	</div>
	<!--  -->
	<c:choose>
		<c:when test="${!EditCategory}">
			<div class="container" data-ng-app="myApp"
				data-ng-controller="MyController" data-ng-init="getDataFromServer()">
				<form>
					<input
						class="w3-input w3-animate-input w3-border w3-round w3-small"
						data-ng-model="search" type="text" placeholder=" Search Product"
						style="width: 20%">

				</form>
				<br>
				<table class="table table-bordered table-hover ">
					<thead>
						<tr >
							<th>Product ID</th>
							<th>Product Name</th>
							<th>Product Description</th>
							<th>Product Price</th>
							<th>Supplier Id</th>
							<th>Category Id</th>
							<th>Edit</th>
							<th>Delete</th>
						</tr>
					</thead>
					<tbody>
						<tr
							data-ng-repeat="product in products | orderBy:sortType:sortReverse | filter:search">
							<td>{{product.id}}</td>
							<td>{{product.name}}</td>
							<td>{{product.description}}</td>
							<td>{{product.price}}</td>
							<td>{{product.supplierid}}</td>
							<td>{{product.categoryid}}</td>
							<td><a class="btn btn-info btn-xs"
								href="editproduct/{{product.id}}">Edit</a></td>
							<td><a class="btn btn-danger btn-xs"
								href="removeproduct/{{product.id}}">Delete</a></td>
						</tr>
					</tbody>
				</table>
			</div>
		</c:when>
		<c:otherwise>
			<div style="margin-bottom: 70px"></div>
		</c:otherwise>
	</c:choose>
</body>
</html>
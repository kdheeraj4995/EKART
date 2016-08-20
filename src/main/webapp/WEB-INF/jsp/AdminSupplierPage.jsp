<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Supplier Page</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link href="<c:url value="/resources/css/w3.css" />" rel="stylesheet">
<link href="<c:url value="/resources/css/font-awesome.min.css" />" rel="stylesheet">
</head>
</head>
<body style="padding-top: 100px">
<!-- ########################################################################## -->
<div>
		<div class="w3-row w3-padding">
			<div class="w3-container w3-third"></div>
			<div class="w3-container w3-third">
				<c:url var="addAction" value="addsupplier"></c:url>
				<form:form action="${addAction}" commandName="supplier"
					enctype="multipart/form-data" method="post">
					<table class="w3-table w3-bordered w3-striped w3-card-4">
						<tr class="w3-cyan">
							<th colspan="2">Add Supplier</th>
						</tr>
						<tr>
							<td><form:label path="id">
									<spring:message text="ID" />
								</form:label></td>
							<c:choose>
								<c:when test="${!empty supplier.id}">
									<td><form:input path="id" readonly="true" /></td>
								</c:when>

								<c:otherwise>
									<td><form:input path="id" pattern=".{2,10}"
											required="true" title="id should contains 2 to 10 characters" /></td>
								</c:otherwise>
							</c:choose>
						<tr>
							<td><form:label path="name">
									<spring:message text="Name" />
								</form:label></td>
							<td><form:input path="name" required="true" /></td>
						</tr>
						<tr>
							<td><form:label path="address">
									<spring:message text="Address" />
								</form:label></td>
							<td><form:input path="address" required="true" /></td>
						</tr>
						<tr>
							<td><form:label path="image">
									<spring:message text="Image" />
								</form:label></td>
							<td><form:input type="file" path="image" /></td>
						</tr>
						<tr>
							<td colspan="2"><c:if test="${!empty supplier.name}">
									<input type="submit" class="w3-btn w3-blue"
										value="<spring:message text="Edit Supplier"/>" />
								</c:if> <c:if test="${empty supplier.name}">
									<input type="submit" class="w3-btn w3-blue"
										value="<spring:message text="Add Supplier"/>" />
								</c:if></td>
						</tr>
					</table>
				</form:form>
			</div>
		</div>
		<div class="w3-container w3-third"></div>
<br>		
<!-- ########################################################################## -->
		
		<div class="w3-row">
			<div class="w3-container w3-quarter"></div>
			<div class="w3-container w3-half">

				<c:if test="${!empty supplierList}">
					<table class="w3-table w3-bordered w3-striped w3-card-4">
						<tr class="w3-cyan">
							<th>Supplier ID</th>
							<th>Supplier Name</th>
							<th>Supplier Address</th>
							<th>Edit</th>
							<th>Delete</th>
						</tr>
						<c:forEach items="${supplierList}" var="supplier">
							<tr>
								<td>${supplier.id}</td>
								<td>${supplier.name}</td>
								<td>${supplier.address}</td>

								<td>
									<form action="editsupplier/${supplier.id}" method="post">
										<input type="submit" class="w3-btn w3-blue" value="Edit">
									</form>
								</td>
								<td><form action="removesupplier/${supplier.id}">
										<input type="submit" class="w3-btn w3-blue" value="Delete">
									</form></td>
							</tr>
						</c:forEach>
					</table>
				</c:if>
			</div>
		<div class="w3-container w3-quarter"></div>
		</div>
		
<!-- ########################################################################## -->

<%-- <img alt="Image" src="<c:url value="/resources/images/product/${supplier.id}.jpg"> </c:url>">

<img src="<%=request.getContextPath() +"/resources/images/supplier/${supplier.id}.jpg"%>" alt="${supplier.id}" /> --%>
</div>	
</body>
</html>
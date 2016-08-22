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
<link href="<c:url value="/resources/css/font-awesome.min.css" />" rel="stylesheet">
</head>
<body style="padding-top: 100px">
	
	<div>
		<div class="w3-row">
			<div class="w3-container w3-third"></div>
			<div class="w3-container w3-third">
			<c:url var="addAction" value="admin/addcategory"></c:url>
				<form:form action="${addAction}" commandName="category">
					<table class="w3-table w3-bordered w3-striped w3-card-4">
					<tr class="w3-cyan"><th colspan="2" >Add Category</th></tr>
						<tr>
							<td><form:label path="id">
									<spring:message text="ID" />
								</form:label></td>
							<c:choose>
								<c:when test="${!empty category.id}">
									<td><form:input path="id" readonly="true" />
									</td>
								</c:when>
								<c:otherwise>
									<td><form:input path="id" pattern=".{2,10}"
											required="true" title="id should contains 2 to 10 characters" /></td>
								</c:otherwise>
							</c:choose>
						<tr>
							<td><form:label path="name">
								</form:label></td>
							<td><form:input path="name" required="true" /></td>
						</tr>
						<tr>
							<td><form:label path="description">
								</form:label></td>
							<td><form:input path="description" required="true" /></td>
						</tr>
						<tr>
							<td colspan="2">
							<c:if test="${!empty category.name}">
									<input type="submit" class="w3-btn w3-blue"
										value="<spring:message text="Edit category"/>" />
								</c:if> 
							<c:if test="${empty category.name}">
									<input type="submit" class="w3-btn w3-blue"
										value="<spring:message text="Add category"/>" />
							</c:if></td>
						</tr>
					</table>
				</form:form>
			</div>
		</div>
			<div class="w3-container w3-third"></div>
			<br>
			<div class="w3-row">
				<div class="w3-container w3-quarter"></div>
				<div class="w3-container w3-half">

					<c:if test="${!empty categoryList}">
						<table class="w3-table w3-bordered w3-striped w3-card-4">
							<tr class="w3-cyan">
								<th>Category ID</th>
								<th>Category Name</th>
								<th>Category Description</th>
								<th>Edit</th>
								<th>Delete</th>
							</tr>
							<c:forEach items="${categoryList}" var="category">
								<tr>
									<td>${category.id}</td>
									<td>${category.name}</td>
									<td>${category.description}</td>
									<td>
										<form action="editcategory/${category.id}" method="post">
											<input type="submit" class="w3-btn w3-blue" class="w3-btn w3-blue" value="Edit">
										</form>
									</td>
									<td><form action="removecategory/${category.id}">
											<input type="submit" class="w3-btn w3-blue" value="Delete">
										</form></td>
							</tr>
							</c:forEach>
						</table>
					</c:if>
				</div>
				<div class="w3-container w3-quarter"></div>
			</div>
		</div>
		
		
</body>
</html>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel="stylesheet"
	href="<spring:url value="/resources/css/material.min.css"/>"
	type="text/css">
	<link rel="stylesheet" href="http://fonts.googleapis.com/css?family=Roboto:300,400,500,700" type="text/css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
<script src="<spring:url value="/resources/js/material.min.js"/>"></script>
<link rel="stylesheet"
	href="https://fonts.googleapis.com/icon?family=Material+Icons">
<title>Sign In</title>
<style>
.util-center {
	margin: auto;
}

.util-spacing-h--40px {
	margin-top: 40px;
	margin-bottom: 40px;
}
</style>
</head>
<body class="mdl-color--blue-grey-50">
	<!-- LOGIN FORM -->
	<div class="mdl-grid">

		<div
			class="mdl-card mdl-shadow--16dp util-center util-spacing-h--40px">
			<div class="mdl-card__title mdl-color--orange-800">
				<h2 class="mdl-card__title-text mdl-color-text--white">User
					Login</h2>
			</div>
			<div class="mdl-card__supporting-text mdl-grid">

				<b class="mdl-color-text--accent">${error}</b>
				<spring:url value="/user/signin" var="sign"/>
				<form:form action="${sign}" method="post" modelAttribute="user">
				
					<input type="hidden" name="action" value="login" />



					<div
						class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label mdl-cell mdl-cell--12-col">
						<label class="mdl-textfield__label mdl-color-text--grey"
							for="textfield_username">Username</label> 
							<form:input path="userEmail" id="textfield_username" cssClass="mdl-textfield__input"
							type="text"/>
							<!-- <input
							class="mdl-textfield__input" type="text" id="textfield_username"
							name="username" /> -->
					</div>

					<div
						class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label mdl-cell mdl-cell--12-col">
						<label class="mdl-textfield__label mdl-color-text--grey"
							for="textfield_password">Password</label> 
							<form:input path="userPass" id="textfield_password" cssClass="mdl-textfield__input"
							type="password"
							/>
							<!-- <input
							class="mdl-textfield__input" type="password"
							id="textfield_password" name="password" /> -->

					</div>

					<div class="mdl-cell mdl-cell--12-col send-button" align="center">

						<button type="submit"
							class="mdl-button mdl-js-ripple-effect mdl-js-button mdl-button--raised mdl-button--colored mdl-color--primary">
							Log In</button>
					</div>
					<div class="mdl-cell mdl-cell--12-col" align="center">
						<p>
							New User?<a href='<spring:url value="/user/register"/>'>Click Here</a>
						</p>
					</div>
				</form:form>
			</div>
		</div>
	</div>


</body>




</html>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="stylesheet"
	href="<spring:url value="/resources/css/material.min.css"/>"
	type="text/css">
	<link rel="stylesheet" href="http://fonts.googleapis.com/css?family=Roboto:300,400,500,700" type="text/css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
<script src="<spring:url value="/resources/js/material.min.js"/>"></script>
<link rel="stylesheet"
	href="https://fonts.googleapis.com/icon?family=Material+Icons">
<title>Register</title>
<style>
.util-center {
	margin: auto;
}

.util-spacing-h--40px {
	margin-top: 40px;
	margin-bottom: 40px;
}
</style>
<script type="text/javascript">
function validatePassword(){
	  if($("#textfield_new_password").value != $("#textfield_password_confirm").value) {
		  $("#textfield_password_confirm").setCustomValidity("Passwords Don't Match");
	  } 
	}

	password.onchange = validatePassword;
	confirm_password.onkeyup = validatePassword;
</script>
</head>
<body class="mdl-color--blue-grey-50">
	<div class="mdl-grid">
		<div
			class="mdl-card mdl-shadow--16dp util-center util-spacing-h--40px">
			<div class="mdl-card__title mdl-color--teal-500">
				<h2 class="mdl-card__title-text mdl-color-text--white">Create a
					New Account</h2>
			</div>
			<div class="mdl-card__supporting-text mdl-grid">

				<b class="mdl-color-text--accent">${error}</b>
				
				<spring:url value="/user/register" var="reister"/>
			<form:form method="post" action="${register}" modelAttribute="user">
				
					<input type="hidden" name="action" value="register" />

					<div
						class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label mdl-cell mdl-cell--12-col">
						<label class="mdl-textfield__label mdl-color-text--grey"
							for="textfield_new_username">Username</label> 
							<form:input id="textfield_new_username" path="userEmail" 
							cssClass="mdl-textfield__input" type="text" pattern="[a-z0-9._%+-]+@[a-z0-9.-]+\.[a-z]{2,3}$"  />
						
							<span
							class="mdl-textfield__error">enter valid EmailId</span>
					</div>

					<div
						class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label mdl-cell mdl-cell--12-col">
						<label class="mdl-textfield__label mdl-color-text--grey"
							for="textfield_new_password">Password</label> 
							<form:input id="textfield_new_password" path="userPass" type="password"  cssClass="mdl-textfield__input" 
								pattern="((?=.*\d)(?=.*[a-z])(?=.*[A-Z])(?=.*[@#$%]).{6,20})" />
						
						<span class="mdl-textfield__error"> 6-20 characters with at
							least a digit, lowercase and uppercase letters, and special
							symbol in @#$% </span>
					</div>

					<div
						class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label mdl-cell mdl-cell--12-col">
						<label class="mdl-textfield__label mdl-color-text--grey"
							for="textfield_password_confirm">Password Confirm</label> 
							
							<input
							class="mdl-textfield__input" type="password" 
							id="textfield_password_confirm" name="password_confirm" pattern="((?=.*\d)(?=.*[a-z])(?=.*[A-Z])(?=.*[@#$%]).{6,20})" />
							<span id="message" class="mdl-textfield__error">Passowrd should be same as above </span>
								
					</div>

					<div class="mdl-cell mdl-cell--12-col " align="center">
						<button 
							class="mdl-button mdl-js-ripple-effect mdl-js-button mdl-button--raised mdl-button--colored"
							id="register">Register</button>
					</div>
					<div class="mdl-cell mdl-cell--12-col" align="center">
						<p>
							Already have an account?<a href='<spring:url value="/user/signin"/>'>Click Here</a>
						</p>
					</div>
				
				</form:form>
			</div>
		</div>
	</div>
</body>
</html>
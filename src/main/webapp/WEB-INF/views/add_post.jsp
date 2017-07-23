<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="stylesheet" href="http://fonts.googleapis.com/css?family=Roboto:300,400,500,700" type="text/css">
<link rel="stylesheet" href="<spring:url value="/resources/css/material.min.css"/>" type="text/css" >
<link href='<spring:url value="/resources/css/style.css"/>' rel="stylesheet" >
<link rel="stylesheet" href="http://fonts.googleapis.com/css?family=Roboto:300,400,500,700" type="text/css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
<script src="<spring:url value="/resources/js/material.min.js"/>"></script>
<link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
<style type="text/css">

 <style>
		.mdl-layout {
	       align-items: center;
           justify-content: center;
           }
            .mdl-layout__content {
	       margin:auto;
	       flex: none;
        } 
         .mdl-card{
            width: 100%;
        }  
     
        .text-area{
            width: 100%;
        } 
    </style>
</style>
</head>
<body>
	<div class="mdl-layout mdl-js-layout mdl-color--blue-grey-50 mdl-layout--fixed-header" >
		 <header class="mdl-layout__header">
    <div class="mdl-layout__header-row">
      <!-- Title -->
      <span class="mdl-layout-title"><a href='<spring:url value="/"/>' style="color: #FFFFFF;text-decoration: none">Post</a></span>
      <!-- Add spacer, to align navigation to the right -->
      <div class="mdl-layout-spacer"></div>
      <!-- Navigation. We hide it in small screens. -->
      <nav class="mdl-navigation ">
      <c:choose>
      
 	  <c:when test="${userEmail == null}">
        <a class="mdl-navigation__link" href='<spring:url value="/user/signin"/>'>
        <button class=" mdl-button mdl-js-button mdl-button--raised mdl-button--accent mdl-js-ripple-effect">
       		 Sign In
        </button>
        </a>   
        </c:when>
        <c:otherwise>  
      		  <p class="mdl-navigation__link" style="color: #FFFFFF;font-size:25px">Welcome, ${userEmail}</p> <a class="mdl-navigation__link" 
      		  href='<spring:url value="/user/logout"/>' 
      		 >
       			 <button class=" mdl-button mdl-js-button mdl-button--raised mdl-button--accent mdl-js-ripple-effect"
       			 style="margin-left:-40px">
      	 		Logout
       	 </button>
        </a>
    	</c:otherwise>  
        </c:choose>
      </nav>
    </div>
  </header>
		
		
		<main class="mdl-layout__content"> 
		<spring:url value="/post/add" var="save" />
			<form:form action="${save}" method="post" modelAttribute="post" >
			<div class="mdl-card mdl-shadow--16dp">
				<div
					class="mdl-card__title mdl-color--primary mdl-color-text--white">
					<h2 class="mdl-card__title-text">
					<i class="material-icons">create</i>&nbsp;
					Post something</h2>
				</div>
				<div class="mdl-card__supporting-text mdl-grid">

					<div class="mdl-textfield mdl-js-textfield mdl-cell mdl-cell--12-col">
					<c:choose>
					<c:when test="${userEmail!=null }">
						<form:input path="authorName" id="username" type="email" value="${userEmail}" disabled="true" cssClass="mdl-textfield__input" />
						
						<label class="mdl-textfield__label" for="username">Your
							Email Id</label>
					</c:when>
					<c:otherwise>
						<form:input path="authorName" id="username" type="email"  cssClass="mdl-textfield__input" />
					
						<label class="mdl-textfield__label" for="username">Your
							Email Id</label>
					</c:otherwise>		
					</c:choose>
					</div>
					<div class="mdl-textfield mdl-js-textfield mdl-cell mdl-cell--12-col">
						<form:input path="title" id="ttl" cssClass="mdl-textfield__input"/>
						<!-- <input class="mdl-textfield__input" name="title" type="text" /> -->
						<label class="mdl-textfield__label" for="ttl">Title</label>

					</div>
					<div class="text-area mdl-textfield mdl-js-textfield mdl-cell mdl-cell--12-col">
						<form:textarea path="body" id="discript" rows="3" cssClass="mdl-textfield__input"/>
						<!-- <textarea class="mdl-textfield__input" name="body" type="text"
							rows="3" id="sample5"></textarea> -->
						<label class="mdl-textfield__label" for="discript">Description...</label>
					</div>
				</div>
				<div class="mdl-card__actions mdl-card--border">
					<button
						class="mdl-cell mdl-cell--3-col mdl-button mdl-button--colored mdl-button--raised mdl-js-button mdl-js-ripple-effect">Post
						&nbsp;<i class="material-icons">send</i>
						</button>
				</div>
			</div>
		</form:form>
		</main>
	</div>
</body>
</html>		
		
		

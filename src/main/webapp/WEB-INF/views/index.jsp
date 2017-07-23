<%@page import="org.springframework.web.bind.annotation.CookieValue"%>
<%@page import="com.app.post.model.User" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="stylesheet" href="<spring:url value="/resources/css/material.min.css"/>" type="text/css" >
<link href='<spring:url value="/resources/css/style.css"/>' rel="stylesheet" >
<link rel="stylesheet" href="http://fonts.googleapis.com/css?family=Roboto:300,400,500,700" type="text/css">
<script type="text/javascript" src='<spring:url value="/resources/js/jquery-3.2.1.min.js"/>'></script>
<script src="<spring:url value="/resources/js/material.min.js"/>"></script>
<link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
    <title>post-anything</title>
    <script type="text/javascript">
    $(function() {
    	 console.log($("#detailedView").attr("href"));
   		
    	 $("#detailedView").click(function() {
    		    $.ajax({
    		    	url:$("#detailedView").attr("href"),
    		    	type:"POST",
    		    	success:function(data){
    		    		$("#main").html(data);
    		    	},
    		    	
    		    });
    		    event.preventDefault();
    	 });
    });    
    
    </script>
    
 
</head>
<body>
  <!-- Always shows a header, even in smaller screens. -->
<div class="mdl-layout mdl-js-layout mdl-layout--fixed-header">
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
      		  <p class="mdl-navigation__link" style="color: #FFFFFF;font-size:18px">Welcome, ${userEmail}</p> <a class="mdl-navigation__link" 
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
		<main id="main" class="main_content">
		<ul class="mdl-list">
			<c:forEach items="${posts}" var="post">
				<li class="mdl-list__item">
					<div class="my__mdl-card mdl-card  mdl-shadow--2dp">
						<div class="mdl-card__title">
							<h2 class="mdl-card__title-text">${post.title}</h2>
						</div>
						<div class="mdl-card__supporting-text">
							<p>${post.date}</p>
						
							
							<span class="mdl-chip"> 
								 <span class="mdl-chip__text">${post.authorName}</span>
							</span>
						</div>
						<div class="mdl-card__actions mdl-card--border">
						<spring:url value="/post/view/${post.id}" var="viewurl"/>
							<a id="detailedView"  href="${viewurl}"
								class="mdl-button mdl-button--colored mdl-js-button mdl-js-ripple-effect">
								Read More.... </a>
						</div>
					</div>

				</li>
			</c:forEach>
		</ul>
		
		<!-- Colored FAB button with ripple --> 
	
		</main>
			<a
			href='<spring:url value="/post/add"/>' id="addPost" onclick=""
			class="mdl-button mdl-js-button mdl-button--fab mdl-js-ripple-effect mdl-button--colored mdl-shadow--2dp mdl-floating-button">
			<i class="material-icons">add</i>
		</a>
	</div>
</body>
</html>
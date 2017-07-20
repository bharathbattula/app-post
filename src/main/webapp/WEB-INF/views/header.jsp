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
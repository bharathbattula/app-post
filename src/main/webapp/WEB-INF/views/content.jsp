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
		<a
			href='<spring:url value="/post/add"/>' id="addPost" onclick=""
			class="mdl-button mdl-js-button mdl-button--fab mdl-js-ripple-effect mdl-button--colored mdl-shadow--2dp mdl-floating-button">
			<i class="material-icons">add</i>
		</a>
<div class="mdl-layout mdl-js-layout mdl-color--blue-grey-50">
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
						<form:input path="authorName" id="username" type="email" cssClass="mdl-textfield__input" />
						<!-- <input class="mdl-textfield__input" name="authorName" type="email" /> -->
						<label class="mdl-textfield__label" for="username">Your
							Email Id</label>
						
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
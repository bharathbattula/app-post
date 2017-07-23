
<div class="mdl-grid" >
  <div class="mdl-cell mdl-cell--4-col" >
    <a id="" href="" class="mdl-button mdl-js-button mdl-js-ripple-effect mdl-button--colored mdl-button--accent mdl-shadow--2dp">
        <i class="material-icons">arrow_back</i>
        Back
    </a>
    </div>
    <div class=" mdl-cell mdl-cell--8-col">
	<div class="mdl-card mdl-shadow--2dp" style="width:80%">
        <div class="mdl-card__title mdl-card--border " style=" background-color:aliceblue">
            <div class="mdl-card__title-text">${post.title}</div>
        </div>
         <div class="mdl-card__supporting-text mdl-card--border">
        <div class="mdl-card__subtitle-text ">
            <p>${post.date }</p>
        </div>
      <span class="mdl-chip  ">
                        <span class="mdl-chip__text ">${post.authorName}</span>
                    </span>
        </div>
        <div class="mdl-card__supporting-text">${post.body}
        </div>
    </div>
        
    </div>
</div>
<#include "header.ftl">
<#include "menu.ftl">

	<div class="row-fluid marketing">
        <div class="span9">
          <ul>
          	<#list posts as post>
          		<#if (post.status == "published") && (post.category??) && (post.category == "blog")>
          			<p>${post.date?string("dd MMMM yyyy")} - <a href="/${post.uri}">${post.title}</a></p>
          		</#if>
          	</#list>
          </ul>          
        </div>        
      </div>

<#include "footer.ftl">

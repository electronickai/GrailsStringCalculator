<li class="dropdown dropdown-btn">
	<a class="dropdown-toggle" data-toggle="dropdown" href="#">
   		<i class="glyphicon glyphicon-info-sign"></i>
		<g:message code="kickstart.info.label"/> <b class="caret"></b>
	</a>
	
	<ul class="dropdown-menu">
		<%-- Note: Links to pages without controller are redirected in conf/UrlMappings.groovy --%>
		<li class="">
			<a href="${createLink(uri: '/about')}">
				<i class="glyphicon glyphicon-info-sign"></i>
				<g:message code="kickstart.about.label"/>
			</a>
		</li>
		<li class="">
			<a href="http://wordpress.com/signup/">
				<i class="glyphicon glyphicon-align-justify"></i>
				<i><g:message code="kickstart.blog.label"/></i>
			</a>
		</li>
		<li class="">
			<a href="${createLink(uri: '/terms')}">
				<i class="glyphicon glyphicon-exclamation-sign"></i>
				<g:message code="kickstart.terms.label"/>
			</a>
		</li>
		<li class="">
			<a href="${createLink(uri: '/contact')}">
				<i class="glyphicon glyphicon-envelope"></i>
				<g:message code="kickstart.contact.label"/>
			</a>
		</li>
	</ul>
</li>

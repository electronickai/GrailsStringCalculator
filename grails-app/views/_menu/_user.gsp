<li class="dropdown">

<%--activate again with spring security plugin installed--%>
<%--<sec:ifNotLoggedIn>--%>
<a class="dropdown-toggle" data-toggle="dropdown" href="#">
			<!-- TODO: integrate Springsource Security etc. and show User's name ... -->
    		<i class="glyphicon glyphicon-user"></i>
    			<g:message code="kickstart.signin.label"/><b class="caret"></b>
		</a>

		<ul class="dropdown-menu" role="menu">
			<li class="form-container">
				<form action="/fourpl/j_spring_security_check" method="post" accept-charset="UTF-8">
<%--				<form action="login" method="post" accept-charset="UTF-8">--%>
					<input class="form-control" style="margin-bottom: 15px;" type="text"		placeholder="Username" id="username" name="j_username">
					<input class="form-control" style="margin-bottom: 15px;" type="password"	placeholder="Password" id="password" name="j_password">
					<input style="float: left; margin-right: 10px;" type="checkbox" name="remember-me" id="remember-me" value="1">
					<label class="string optional" for="user_remember_me">Remember me</label>
					<input class="btn btn-primary btn-block" type="submit" id="sign-in" value="Sign In">
				</form>
			</li>
			<li class="divider"></li>
			<li class="button-container">
				<!-- NOTE: the renderDialog MUST be placed outside the NavBar (at least for Bootstrap 2.1.1): see bottom of main.gsp -->
				<g:render template="/_modals/registerTextLink"/>
			</li>
		</ul>

<%--</sec:ifNotLoggedIn>
<sec:ifLoggedIn>
<a class="dropdown-toggle" role="button" data-toggle="dropdown" data-target="#" href="#">
		<!-- TODO: Only show menu items based on permissions (e.g., Guest has no account page) -->
			<i class="glyphicon glyphicon-user icon-white"></i>
			<g:message code="greeting" args="[sec.loggedInUserInfo(field: 'username')]"/>
		</a>
		<ul class="dropdown-menu" role="menu">
			<!-- TODO: Only show menu items based on permissions -->
			<li class=""><a href="${createLink(uri: '/')}">
				<i class="glyphicon glyphicon-user"></i>
				<g:message code="user.show.label"/>
			</a></li>
			<li class=""><a href="${createLink(uri: '/')}">
				<i class="glyphicon glyphicon-cogs"></i>
				<g:message code="user.settings.change.label"/>
			</a></li>
			
			<li class="divider"></li>
			<li class=""><a href="${createLink(uri: '/j_spring_security_logout')}">
				<i class="glyphicon glyphicon-off"></i>
				<g:message code="security.signoff.label"/>
			</a></li>
		</ul>

</sec:ifLoggedIn>--%>
</li>

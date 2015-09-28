<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="\${message(code: '${domainClass.propertyName}.label', default: '${className}')}" />
		<title><g:message code="default.create.label" args="[entityName]" /></title>
	</head>
	<body>
		<div class="nav" role="navigation">
			<br>
			<a class="home" href="\${createLink(uri: '/')}"><span class="glyphicon glyphicon-home"></span> <g:message code="default.home.label"/></a><br>
			<g:link class="list" action="index"><span class="glyphicon glyphicon-th-list"></span> <g:message code="default.list.label" args="[entityName]"/></g:link><br>
			<br>
		</div>
		<div id="create-${domainClass.propertyName}" class="panel panel-primary" role="main">
			<div class='panel-heading'>
				<h3 class='panel-title'><g:message code="default.create.label" args="[entityName]" /></h3>
			</div>
			<div class='panel-body'>
				<g:if test="\${flash.message}">
					<div class="message" role="status">\${flash.message}</div>
				</g:if>
				<g:hasErrors bean="\${${propertyName}}">
					<ul class="errors" role="alert">
						<g:eachError bean="\${${propertyName}}" var="error">
							<li <g:if test="\${error in org.springframework.validation.FieldError}">data-field-id="\${error.field}"</g:if>><g:message error="\${error}"/></li>
						</g:eachError>
					</ul>
				</g:hasErrors>
				<g:form url="[resource:${propertyName}, action:'save']" <%= multiPart ? ' enctype="multipart/form-data"' : '' %>>
					<fieldset class="form">
						<g:render template="form"/>
					</fieldset>
					<fieldset class="buttons">
						<g:submitButton name="create" class="save" value="\${message(code: 'default.button.create.label', default: 'Create')}" />
					</fieldset>
				</g:form>
			</div>
		</div>
	</body>
</html>

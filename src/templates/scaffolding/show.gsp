<% import grails.persistence.Event %>
<%=packageName%>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="\${message(code: '${domainClass.propertyName}.label', default: '${className}')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<div class="nav" role="navigation">
			<br>
			<a class="home" href="\${createLink(uri: '/')}"><span class="glyphicon glyphicon-home"></span> <g:message code="default.home.label"/></a><br>
			<g:link class="list" action="index"><span class="glyphicon glyphicon-th-list"></span> <g:message code="default.list.label" args="[entityName]"/></g:link><br>
			<g:link class="create" action="create"><span class="glyphicon glyphicon-star"></span> <g:message code="default.new.label" args="[entityName]"/></g:link>
			<br>
		</div>
		<br>
		<div id="show-${domainClass.propertyName}" class="panel panel-primary" role="main">
			<div class='panel-heading'>
				<h3 class='panel-title'><g:message code="default.show.label" args="[entityName]" /></h3>
			</div>
			<div class='panel-body'>
				<g:if test="\${flash.message}">
					<div class="message" role="status">\${flash.message}</div>
				</g:if>
				<%  excludedProps = Event.allEvents.toList() << 'id' << 'version'
					allowedNames = domainClass.persistentProperties*.name << 'dateCreated' << 'lastUpdated'
					props = domainClass.properties.findAll { allowedNames.contains(it.name) && !excludedProps.contains(it.name) && (domainClass.constrainedProperties[it.name] ? domainClass.constrainedProperties[it.name].display : true) }
					Collections.sort(props, comparator.constructors[0].newInstance([domainClass] as Object[]))
					props.each { p -> %>
					<g:if test="\${${propertyName}?.${p.name}}">
						<span id="${p.name}-label" class="col-md-2"><g:message code="${domainClass.propertyName}.${p.name}.label" default="${p.naturalName}" /></span>
						<%  if (p.isEnum()) { %>
							<span class="col-md-10" aria-labelledby="${p.name}-label"><g:fieldValue bean="\${${propertyName}}" field="${p.name}"/></span>
						<%  } else if (p.oneToMany || p.manyToMany) { %>
							<g:each in="\${${propertyName}.${p.name}}" var="${p.name[0]}">
							<span class="col-md-10" aria-labelledby="${p.name}-label"><g:link controller="${p.referencedDomainClass?.propertyName}" action="show" id="\${${p.name[0]}.id}">\${${p.name[0]}?.encodeAsHTML()}</g:link></span>
							</g:each>
						<%  } else if (p.manyToOne || p.oneToOne) { %>
							<span class="col-md-10" aria-labelledby="${p.name}-label"><g:link controller="${p.referencedDomainClass?.propertyName}" action="show" id="\${${propertyName}?.${p.name}?.id}">\${${propertyName}?.${p.name}?.encodeAsHTML()}</g:link></span>
						<%  } else if (p.type == Boolean || p.type == boolean) { %>
							<span class="col-md-10" aria-labelledby="${p.name}-label"><g:formatBoolean boolean="\${${propertyName}?.${p.name}}" /></span>
						<%  } else if (p.type == Date || p.type == java.sql.Date || p.type == java.sql.Time || p.type == Calendar) { %>
							<span class="col-md-10" aria-labelledby="${p.name}-label"><g:formatDate date="\${${propertyName}?.${p.name}}" /></span>
						<%  } else if (!p.type.isArray()) { %>
							<span class="col-md-10" aria-labelledby="${p.name}-label"><g:fieldValue bean="\${${propertyName}}" field="${p.name}"/></span>
						<%  } %>
						<br>
					</g:if>
				<%  } %>
				<br>
				<g:form url="[resource:${propertyName}, action:'delete']" method="DELETE">
					<fieldset>
						<g:link class="col-md-2" action="edit" resource="\${${propertyName}}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
						<g:actionSubmit class="col-md-2" action="delete" value="\${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('\${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
					</fieldset>
				</g:form>
			</div>
		</div>
	</body>
</html>

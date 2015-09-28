<g:if test="${params.controller == 'airExportHouse'}">
<ul class="nav nav-tabs" role="tablist">
	<li <%if (params.action == 'listShipments') { %>
			class="active"
		<%}%>>
		<g:link action="listShipments"><span class="glyphicon glyphicon-search"></span> Search</g:link>
	</li><li <%if (params.action == 'editShipment' || params.action == 'createShipment') { %>
			class="active"
		<%}%>>
		<g:link action="createShipment"><span class="glyphicon glyphicon-home"></span> General</g:link>
	</li><li <%if (params.action == 'partners') { %>
			class="active"
		<%}%>>
		<g:link action="partners"><span class="glyphicon glyphicon-user"></span> Partners</g:link>
	</li><li <%if (params.action == 'cargoDetails') { %>
			class="active"
		<%}%>>
		<g:link action="cargoDetails"><span class="glyphicon glyphicon-tags"></span> CargoDetails</g:link>
	</li><li <%if (params.action == 'services') { %>
			class="active"
		<%}%>>
		<g:link action="services"><span class="glyphicon glyphicon-tasks"></span> Services</g:link>
	</li><li<%if (params.action == 'documents') { %>
			class="active"
		<%}%>>
		<g:link action="documents"><span class="glyphicon glyphicon-file"></span> Documents</g:link>
	</li>
</ul>
</g:if>
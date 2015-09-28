<!DOCTYPE html>
<%-- <html lang="${org.springframework.web.servlet.support.RequestContextUtils.getLocale(request).toString().replace('_', '-')}"> --%>
<html
	lang="${session.'org.springframework.web.servlet.i18n.SessionLocaleResolver.LOCALE'}">

<head>
<title><g:layoutTitle default="${meta(name:'app.name')}" /></title>

<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta name="description" content="">
<meta name="author" content="">

<link rel="apple-touch-icon" href="assets/ico/apple-touch-icon.png">
<link rel="apple-touch-icon"
	href="assets/ico/apple-touch-icon-72x72.png" sizes="72x72">
<link rel="apple-touch-icon"
	href="assets/ico/apple-touch-icon-114x114.png" sizes="114x114">

<%-- Manual switch for the skin can be found in /view/_menu/_config.gsp --%>
<asset:stylesheet src="custom-bootstrap.css" />
<asset:stylesheet src="dropdowns-enhancement.css" />
<g:layoutHead />
</head>

<body>

	<g:render template="/_menu/navbar"/>

	<div class="col-md-2">
		<g:render template="/_menu/sidemenu" />
	</div>

	<div class="col-md-10">
		<g:render template="/layouts/content" />
	</div>

	<!-- Enable to insert additional components (e.g., modals, javascript, etc.) by any individual page -->
	<g:if test="${ pageProperty(name:'page.include.bottom') }">
		<g:pageProperty name="page.include.bottom" />
	</g:if>

	<!-- Included Javascript files and other resources -->
	<asset:javascript src="application.js" />
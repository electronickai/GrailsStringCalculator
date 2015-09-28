
<%@ page import="calculator.CalculatorHistory" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<title>String Calculator</title>
	</head>
	<body>
		<formset>
		<legend>Your String Calculator</legend><br>
		<bs:panel heading="Export House Shipment" primary="true">
			<g:form action="calculate">
				<bs:labeledInput label="numbers" value="$adderRequest" labelwidth="col-md-2" inputwidth="col-md-10" controller="${params.controller}"/><br>
				<bs:labeledInput label="adderResult" value="$adderResult" labelwidth="col-md-2" inputwidth="col-md-10"controller="${params.controller}"/><br>
				<g:submitButton name="calculate" value="Calculate"/><br><br>
			</g:form>
		</bs:panel>
		</formset>
	</body>
</html>

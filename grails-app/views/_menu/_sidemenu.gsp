<nav>
  <ul class="nav nav-pills nav-stacked span2">
    <li class="headline">${message(code: 'menu.general.label', default: 'StringCalculator')}</li>
    <li<%if (params.controller == 'calculator') { %>
			class="active"
		<%}%>>
		<a href="/stringcalculator/calculator/">${message(code: 'menu.dashboard.label', default: 'Calculator')}</a></li>
    <li<%if (params.controller == 'calculatorHistory') { %>
			class="active"
		<%}%>>
		<a href="/stringcalculator/calculatorHistory/">${message(code: 'menu.dashboard.label', default: 'History')}</a></li>
  </ul>
</nav>
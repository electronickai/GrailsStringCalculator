package calculator

import geb.spock.GebReportingSpec

class CalculatorFunctionalSpec extends GebReportingSpec {
	
	def "go to the main page"() {
		when: "we go to the calculator page"
		go "calculator"
		
		then: "The calculator page appears"
		$("#Content legend").text == "Your String Calculator"
	}
}

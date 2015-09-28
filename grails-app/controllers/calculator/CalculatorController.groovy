package calculator

class CalculatorController {

	def calculatorService
	
    def index() {
		redirect(action: 'calculate', params: params)
	}
	
	def calculate() {
		def result = calculatorService.add(params.numbers)
		new CalculatorHistory(request: params.numbers, result: result).save()
		[adderRequest: params.numbers, adderResult: result]
	}
}

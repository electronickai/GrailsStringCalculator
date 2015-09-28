package calculator

import grails.transaction.Transactional

@Transactional
class CalculatorService {

    def add (String numbers) {

        checkForErrors(numbers)

        def allNumberMatcher = numbers =~ /\d+/
        def command = ''
        allNumberMatcher.each { //assemble command
            if (it.toInteger() <= 1000) { //ignore numbers greater than 1000
                command += "$it+"
            }
        }

        if (!command) { //return 0 for empty Strings
            return 0
        }

        def shell = new GroovyShell() //Class that evaluates groovy expressions
        shell.evaluate(command[0..-2]) //remove the last "+" again
    }

    void checkForErrors(String numbers) {
        if (numbers =~ /-\d+/) { //check whether negative number is contained
            throw new IllegalArgumentException("negatives not allowed")
        }

        def separatorAndNumbersMatcher = numbers =~ '//(.*)\\n(.*)' //check for separator and number parts
        if (numbers?.startsWith('//') && separatorAndNumbersMatcher.size() != 3) {
            throw new IllegalStateException("Illegal String calculation format")
        }
    }
}

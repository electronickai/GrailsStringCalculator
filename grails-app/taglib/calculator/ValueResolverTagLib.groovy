package calculator

class ValueResolverTagLib {
    static namespace = "res"
	static defaultEncodeAs = [taglib:'none']
    //static encodeAsForTags = [tagName: [taglib:'html'], otherTagName: [taglib:'none']]
	
	def resolve = { attrs ->
    	def value = attrs.value ?: attrs.default
		out << value
	}
}
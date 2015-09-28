package calculator


class BootstrapWidgetsTagLib {

	static namespace = "bs" //should stay for bootstrapped
	static defaultEncodeAs = [taglib:'none']
	//static encodeAsForTags = [tagName: [taglib:'html'], otherTagName: [taglib:'none']]

	private static final String COMBO_EMPTY_TEXT 			= "Please select ..."
	private static final String LABELED_INPUT_LABEL_WIDTH 	= "col-md-2"
	private static final String LABELED_INPUT_INPUT_WIDTH 	= "col-md-4"
	private static final String LABELED_COMBO_LABEL_WIDTH 	= "col-md-2"
	private static final String LABELED_COMBO_COMBO_WIDTH 	= "col-md-4"
	private static final String LABELED_DATE_LABEL_WIDTH 	= "col-md-2"
	private static final String LABELED_DATE_DATE_WIDTH 	= "col-md-2"
	private static final String LABELED_DATE_TIME_WIDTH 	= "col-md-2"
	private static final String LABELED_SEARCH_LABEL_WIDTH 	= "col-md-2"
	private static final String LABELED_SEARCH_SEARCH_WIDTH = "col-md-4"
	private static final String MODAL_REF_PREFIX 			= "#Search"
	
//	<bs:combobox id="shipmentTypeDrop" emptytext="Please select..." values="${["1", "2", "3"]}" value="1"/>
	def combobox = { attrs ->
		def text = attrs.value ?: (attrs.emptytext ?: COMBO_EMPTY_TEXT)
		out << "<div class='btn-group'>"
		out << "<button data-toggle='dropdown' class='btn btn-default dropdown-toggle'>"
		out << text + " "
		out << "<span class='caret'></span>"
		out << "</button>"
		out << "<ul class='dropdown-menu'>"
		def name = attrs.name
		attrs.values.eachWithIndex { value, i ->
			out << "<li><input type='radio' id='${name}_${i}' name='${name}' value='${value}'><label for='${name}_${i}'>${value}</label></li>"
		}
		out << "</ul>"
		out << "</div>"
	}
	
//	<bs:progressBar progress="60"/>
	def progressBar = { attrs ->
		out << "<div class='progress'>"
		out << "<div class='progress-bar' role='progressbar' aria-valuenow='${attrs.progress}' aria-valuemin='0' aria-valuemax='100' style='width: ${attrs.progress}%;'>${attrs.progress}%</div>"
		out << "</div>"
	}
	
//	<bs:labeledInput label="trackingId" value="1234" labelwidth="col-md-2" inputwidth="col-md-4" controller="${params.controller}"/>
	def labeledInput = { attrs ->
		def labelwidth = attrs.labelwidth ?: LABELED_INPUT_LABEL_WIDTH
		def inputwidth = attrs.inputwidth ?: LABELED_INPUT_INPUT_WIDTH
		def value = attrs.value ?: ""
		out << "<span class='${labelwidth}'>"
		out << "<label for='${attrs.label}' class='control-label'>"
		out << g.message(code: "view.${attrs.controller}.${attrs.label}.label")
		out << "</label>"
		out << "</span>"
		out << "<span class='${inputwidth}'>"
		out << g.textField(class: "form-control", name: "${attrs.label}", value: "${value}")
		out << "</span>"
	}
	
//	<bs:labeledCombo label="shipmentType" values="${["1", "2", "3"]}" value="1" labelwidth="col-md-2" combowidth="col-md-4" emptytext="Please select..." controller="${params.controller}"/>
	def labeledCombo = {attrs ->
		def labelwidth = attrs.labelwidth ?: LABELED_COMBO_LABEL_WIDTH
		def combowidth = attrs.combowidth ?: LABELED_COMBO_COMBO_WIDTH
		out << "<span class='${labelwidth}'>"
		out << "<label for='${attrs.label}' class='control-label'>"
		out << g.message(code: "view.${attrs.controller}.${attrs.label}.label")
		out << "</label>"
		out << "</span>"
		out << "<span class='${combowidth}'>"
		out << bs.combobox(name: "${attrs.label}Drop", emptytext: attrs.emptytext, values:attrs.values, value:attrs.value)
		out << "</span>"
	}
	
//	<bs:labeledDateTime label="earliestShippingDate" labelwidth="col-md-2" datewidth="col-md-2" timewitdh="col-md-1" controller="${params.controller}"/>
	def labeledDateTime = {attrs ->
		def labelwidth = attrs.labelwidth ?: LABELED_DATE_LABEL_WIDTH
		def datewidth = attrs.datewidth ?: LABELED_DATE_DATE_WIDTH
		def timewidth = attrs.timewidth ?: LABELED_DATE_TIME_WIDTH
		def dateValue = attrs.value?.format("MM/dd/yyyy") ?: ""
		def timeValue = attrs.value?.format("HH:mm") ?: ""
		out << "<span class='${labelwidth}'>"
		out << "<label for='${attrs.label}' class='control-label'>"
		out << g.message(code: "view.${attrs.controller}.${attrs.label}.label")
		out << "</label>"
		out << "</span>"
		out << "<div class='${datewidth}'>"
		out << "<div class='input-group date'>"
		out << g.textField(class: "form-control", name: "${attrs.label}Date", value: "${dateValue}")
		out << "</input>"
		out << "<span class='input-group-addon'>"
		out << "<i class='glyphicon glyphicon-calendar'>"
		out << "</i>"
		out << "</span>"
		out << "</div>"
		out << "</div>"
		out << "<div class='${timewidth}'>"
		out << "<div class='input-group clockpicker'>"
		out << g.textField(class: "form-control", name: "${attrs.label}Time", value: "${timeValue}")
		out << "<span class='input-group-addon'><span class='glyphicon glyphicon-time'></span></span>"
		out << "</div>"
		out << "</div>"
	}
	
//	<bs:labeledSearch name="owingDepartment" searchItem="Department" labelwidth="col-md-2" searchwidth="col-md-4" controller="${params.controller}"/>
	def labeledSearch = {attrs ->
		def labelwidth = attrs.labelwidth ?: LABELED_SEARCH_LABEL_WIDTH
		def searchwidth = attrs.searchwidth ?: LABELED_SEARCH_SEARCH_WIDTH
		def value = attrs.value ?: ""
		out << "<span class='${labelwidth}'>"
		out << "<label for='${attrs.name}' class='control-label'>"
		out << g.message(code: "view.${attrs.controller}.${attrs.name}.label")
		out << "</label>"
		out << "</span>"
		out << "<div class='${searchwidth}'>"
		out << "<div class='input-group'>"
		out << g.textField(class: "form-control", name: "${attrs.name}", value: "${value}")
		out << "<span class='input-group-btn'>"
		def modalLink = MODAL_REF_PREFIX + (attrs.searchItem ?: attrs.name.capitalize())
		out << "<button type='button' id='${attrs.name}' class='btn btn-default' href='${modalLink}' data-toggle='modal'>"
		out << "<span class='glyphicon glyphicon-search'/>"
		out << "</button>"
		out << "</span>"
		out << "</div>"
		out << "</div>"
	}
	
	//<bs:panel heading="Export House Shipment" primary="true">Content</bs:panel>
	def panel = {attrs, body ->
		if ("true".equalsIgnoreCase(attrs.primary))
			out << "<div class='panel panel-primary'>"
		else
			out << "<div class='panel panel-default'>"
		out << "<div class='panel-heading'>"
		out << "<h3 class='panel-title'>${attrs.heading}</h3>"
		out << "</div>"
		out << "<div class='panel-body'>"
		out << body()
		out << "</div>"
		out << "</div>"
	}
	
	//<bs:row>Content</bs:row>
	def row = {attrs, body ->
		out << "<div class='row'>"
		out << body()
		out << "</div>"
	}
	
	
	def modalDialog = {attrs, body ->
		out << "<div class='modal fade' id='${attrs.identifier}' role='dialog'>"
		out << "<div class='modal-dialog modal-lg'>"
		out << "<div class='modal-content'>"
		out << body()
		out << "</div>"
		out << "</div>"
		out << "</div>"
	}
	
	//<bs:table columns="${["code", "name", "location"]}" resultset=${departments} controller="${params.controller}"/>
	def table = {attrs ->
		out << "<table class='table table-bordered margin-top-medium'>"
		out << "<thead>"
		out << "<tr>"
		attrs.columns.each { name ->
			out << g.sortableColumn(property: "${name}", title: g.message(code: "view.${attrs.controller}.${name}.column"))
		}
		out << "</tr>"
		out << "</thead>"
		out << "<tbody>"
		def selectable = attrs.selectable
		def entityLinkColumn = attrs.entityLinkColumn
		def linkAction = attrs.linkAction
		for (element in attrs.resultset) {
			out << "<tr>"
			attrs.columns.each { name ->
				out << "<td>"
				if (name.equals(entityLinkColumn)) {
					out << g.link (action: linkAction, id: element.id,
						g.fieldValue(bean: element, field: "${name}"))
				}
				else if (name.equals(selectable)) {
					out << "<a class='selectable'>"
					out << g.fieldValue(bean: element, field: "${name}")
					out << "</a>"
				}
				else
					out << g.fieldValue(bean: element, field: "${name}")
				out << "</td>"
			}
			out << "</tr>"
		}
		out << "</tbody>"
		out << "</table>"
	}
}

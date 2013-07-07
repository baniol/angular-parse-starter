'use strict'
# http://piotrbuda.eu/2013/02/angularjs-directive-for-password-matching.html
app = angular.module('startApp');

app.directive "repeatPassword", ->
	# @todo ???
	require: "ngModel"
	link: (scope, elem, attrs, ctrl) ->
		otherInput = elem.inheritedData("$formController")[attrs.repeatPassword]

		ctrl.$parsers.push ( (value) ->
			if value is otherInput.$viewValue
				ctrl.$setValidity "repeat", true
				return value
			ctrl.$setValidity "repeat", false
		)

		otherInput.$parsers.push ( (value) ->
			valid = if value is ctrl.$viewValue then true else false
			ctrl.$setValidity "repeat",valid
			return value
		)

app.directive 'spinner', ->
	(scope, element, attrs) ->
		button = element.find 'button'
		spinnIcon = '<i class="icon-spinner icon-spin icon-large"></i>'
		originalText = button.text()

		element.bind 'submit', ->
			button.html spinnIcon
			button.prop 'disabled', true

		scope.$watch 'spinner', (value) ->
			disabled = scope.$eval(button.attr "ng-disabled")
			button.text originalText
			if not disabled then button.prop 'disabled', false
			scope.spinnIcon = undefined


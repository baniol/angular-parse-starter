'use strict'

# @todo pass as a parameter - not globally (as service?)
Parse.initialize("2mT4e3kMwAOQE88KHzNjXe30sm5rvTM5LdYDTAXQ", "f66n7MEaCaGoTejS3YtePJM0COygvuRCj0pRcURB");

# $logincheck service - injected in ... @todo - precize

app = angular.module('startApp',['ui.bootstrap','angular-flash.service', 'angular-flash.flash-alert-directive']);

app.factory '$logincheck', ->
	Parse.User.current()

app.config ($routeProvider, $locationProvider) ->
	$routeProvider
  		.when '/',
			templateUrl: 'views/main.html'
			controller: 'MainCtrl'
		.when '/login',
			templateUrl: 'views/login.html'
			controller: 'LoginCtrl'
  	.otherwise
		redirectTo: '/'

# @todo - check when is run used
app.run ($logincheck, $location) ->
	if !$logincheck
		$location.path '/login'


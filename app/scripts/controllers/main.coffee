'use strict'

app = angular.module('startApp');

app.controller 'MainCtrl', ($scope,$location) ->
	$scope.username = Parse.User.current().attributes.username
	$scope.logOut = ->
		Parse.User.logOut();
		$location.path '/login'
# @todo - learn about inject
.$inject = ['flash'];


app.controller 'LoginCtrl', ($scope,$location,$logincheck) ->

	# redirecting to the main page if user already logged in
	if $logincheck then $location.path "/"

	$scope.sendLogin = (data) ->
		# show loader in the button submit
		$scope.showError = false
		# sending login try request to parse.com
		Parse.User.logIn data.username, data.password,
			success: (user) ->
				# change the attribute to hide spinner & unblock submit button
				$scope.spinner = not $scope.spinner
				$location.path '/'
				$scope.$apply()
			error: (user,error) ->
				# @todo - ugly - with $q
				$scope.spinner = not $scope.spinner
				$scope.showError = true
				$scope.$apply()


app.controller 'RegisterCtrl', ($scope,$location,flash) ->
	
	$scope.sendRegister = (data) ->
		$scope.emailExists = false;
		$scope.userExists = false;
		user = new Parse.User()
		user.set "username", data.username
		user.set "password", data.password
		user.set "email", data.email
		user.signUp null,
			success: (user) ->
				# @todo - ugly - with $q
				$scope.spinner = not $scope.spinner
				$location.path '/'
				flash.success = 'You have been successfuly registered and logged in. Enjoy :)'
				$scope.$apply()
			error: (user,error) ->
				# @todo - ugly - with $q
				$scope.spinner = not $scope.spinner
				if error.code is 203
					$scope.emailExists = true
					$scope.$apply()
				if error.code is 202
					$scope.userExists = true
					$scope.$apply()

app.controller 'ForgotCtrl', ($scope) ->

	$scope.sendForgot = (email) ->
		$scope.showError = false
		Parse.User.requestPasswordReset email,
			success: ->
				$scope.spinner = not $scope.spinner
				$scope.$apply()
			error: (error) ->
				$scope.showError = true
				$scope.spinner = not $scope.spinner
				$scope.$apply()
				# console.log "Error: " + error.code + " " + error.message

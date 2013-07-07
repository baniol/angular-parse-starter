'use strict';

describe 'angularjsGruntExampleApp app', ->

	beforeEach ->
		browser().navigateTo '/'

	xdescribe 'Login page', ->
		it 'should display the correct route', ->
			expect(browser().location().path()).toBe('/login')

		it 'should display pleas sign in header', ->
			expect(element('div[ng-controller="LoginCtrl"] .form-signin-heading').text()).toBe('Please sign in')

		it 'submit button should be disabled if input fields empty', ->
			expect(element('button[type=submit]').attr('disabled')).toBe('disabled')

		it 'submit button should not be disabled when both fields filled', ->
			input('loginForm.username').enter('name')
			input('loginForm.password').enter('asdf')
			expect(element('button[type=submit]').attr('disabled')).toBe(undefined);

		it 'red alert should not be displayed before sending the form', ->
			expect(element('.alert-error').css('display')).toBe('none')

		it 'should display alert when user credentials incorrect', ->
			input('loginForm.username').enter('name')
			input('loginForm.password').enter('asdf')
			# submit the form
			element('button[type=submit]').click()

			expect(browser().location().path()).toBe('/login')
			sleep(1)
			expect(element('.alert-error').css('display')).toBe('block')

		it 'should redirect to main secured page when user credentials correct', ->
			input('loginForm.username').enter('baniol')
			input('loginForm.password').enter('szapo123')
			# submit the form
			element('button[type=submit]').click()
			sleep(1)
			expect(browser().location().path()).toBe('/')

		it 'should be login after logout', ->
			element('.logout-btn').click()
			# sleep(2)
			# expect(browser().location().path()).toBe('/logout')


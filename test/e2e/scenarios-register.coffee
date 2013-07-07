'use strict';

describe 'angularjsGruntExampleApp app', ->

	beforeEach ->
		browser().navigateTo '/'

	describe 'Register tab', ->

		it 'register tab should not be displayed', ->
			expect(element('.tab-content .tab-pane:nth-child(2)').css('display')).toBe('none')

		it 'register tab should be displayed after clicking register nav link', ->
			element('ul.nav-pills li:nth-child(2) a').click()
			expect(element('.tab-content .tab-pane:nth-child(2)').css('display')).toBe('block')
			expect(element('form[name=formregister] button[type=submit]').attr('disabled')).toBe('disabled')


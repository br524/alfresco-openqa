=begin
Copyright (C) 2005-2009 Alfresco Software Limited.

This program is free software; you can redistribute it and/or
modify it under the terms of the GNU General Public License
as published by the Free Software Foundation; either version 2
of the License, or (at your option) any later version.

This program is distributed in the hope that it will be useful,
but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
GNU General Public License for more details.

You should have received a copy of the GNU General Public License
along with this program; if not, write to the Free Software
Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA 02110-1301, USA.

As a special exception to the terms and conditions of version 2.0 of 
the GPL, you may redistribute this Program in connection with Free/Libre 
and Open Source Software ("FLOSS") applications as described in Alfresco's 
FLOSS exception.  You should have recieved a copy of the text describing 
the FLOSS exception, and it is also available here: 
http://www.alfresco.com/legal/licensing"
=end

require 'rubygems'
require 'firewatir'
require 'csv'

include FireWatir

class TestStepFailed < RuntimeError
end
class InteractionFailure < RuntimeError
end

class Authoring
  @@failedSteps = 0
	@@passedSteps = 0 
  
  def initialize(port, profile)
  csv_keeper = [profile]
	begin

		puts "Starting test.."
		start_time = Time.now
		
		#ie.speed = :fast
    ie = Firefox.new(:port => port, :profile=> profile, :multiple_browser_xpi => true)
    ie.goto("http://10.0.1.11/alfresco/faces/jsp/login.jsp")
    
    sub_timer = Time.now
		# asserting present: [TextField: 'loginForm:user-name']
		begin
			pass = 0
			@textfield0 = ie.text_field(:id, "loginForm:user-name")
			while not @textfield0.exists? do
				if (pass > 20)
					raise TestStepFailed
				end
				sleep 0.1
				pass += 1
			end
			puts "[-PASS-]>[TextField: 'loginForm:user-name']"
			@@passedSteps += 1 
		rescue TestStepFailed
			puts "[-FAIL-]>[TextField: 'loginForm:user-name']"
			@@failedSteps += 1 
			puts "Step failed: Check present: [TextField: 'loginForm:user-name']"
		end
		STDOUT.flush

		# asserting present: [Password: 'loginForm:user-password']
		begin
			pass = 0
			@password0 = ie.text_field(:id, "loginForm:user-password")
			while not @password0.exists? do
				if (pass > 20)
					raise TestStepFailed
				end
				sleep 0.1
				pass += 1
			end
			puts "[-PASS-]>[Password: 'loginForm:user-password']"
			@@passedSteps += 1 
		rescue TestStepFailed
			puts "[-FAIL-]>[Password: 'loginForm:user-password']"
			@@failedSteps += 1 
			puts "Step failed: Check present: [Password: 'loginForm:user-password']"
		end
		STDOUT.flush

		# asserting present: [Button: 'Login']
		begin
			pass = 0
			@button0 = ie.button(:value, "Login")
			while not @button0.exists? do
				if (pass > 20)
					raise TestStepFailed
				end
				sleep 0.1
				pass += 1
			end
			puts "[-PASS-]>[Button: 'Login']"
			@@passedSteps += 1 
		rescue TestStepFailed
			puts "[-FAIL-]>[Button: 'Login']"
			@@failedSteps += 1 
			puts "Step failed: Check present: [Button: 'Login']"
		end
		STDOUT.flush

		# user interaction: Enter text 'admin' [TextField: 'loginForm:user-name']
		begin
			@textfield0.set(profile)
			@@passedSteps += 1 
		rescue
			puts "[-EXCEPTION-]>[TextField: 'loginForm:user-name'] -- " + $!
			@@failedSteps += 1 
			puts "Could not set(\"admin\") [TextField: 'loginForm:user-name']"
			raise InteractionFailure
		end

		# user interaction: Enter text 'admin' [Password: 'loginForm:user-password']
		begin
			@password0.set(profile)
			@@passedSteps += 1 
		rescue
			puts "[-EXCEPTION-]>[Password: 'loginForm:user-password'] -- " + $!
			@@failedSteps += 1 
			puts "Could not set(\"admin\") [Password: 'loginForm:user-password']"
			raise InteractionFailure
		end

		# user interaction: Click [Button: 'Login']
		begin
			@button0.click
			@@passedSteps += 1 
		rescue
			puts "[-EXCEPTION-]>[Button: 'Login'] -- " + $!
			@@failedSteps += 1 
			puts "Could not click [Button: 'Login']"
			raise InteractionFailure
		end
    csv_keeper << Time.now - sub_timer
    
    sub_timer = Time.now
		# asserting present: [Link: 'Company Home']
		begin
			pass = 0
			@link0 = ie.link(:text, "Company Home")
			while not @link0.exists? do
				if (pass > 20)
					raise TestStepFailed
				end
				sleep 0.1
				pass += 1
			end
			puts "[-PASS-]>[Link: 'Company Home']"
			@@passedSteps += 1 
		rescue TestStepFailed
			puts "[-FAIL-]>[Link: 'Company Home']"
			@@failedSteps += 1 
			puts "Step failed: Check present: [Link: 'Company Home']"
		end
		STDOUT.flush
    
    
		# user interaction: Click [Link: 'Company Home']
		begin
			@link0.click
			@@passedSteps += 1 
		rescue
			puts "[-EXCEPTION-]>[Link: 'Company Home'] -- " + $!
			@@failedSteps += 1 
			puts "Could not click [Link: 'Company Home']"
			raise InteractionFailure
		end

		# asserting present: [Link: 'Web Projects']
		begin
			pass = 0
			@link1 = ie.link(:text, "Web Projects")
			while not @link1.exists? do
				if (pass > 20)
					raise TestStepFailed
				end
				sleep 0.1
				pass += 1
			end
			puts "[-PASS-]>[Link: 'Web Projects']"
			@@passedSteps += 1 
		rescue TestStepFailed
			puts "[-FAIL-]>[Link: 'Web Projects']"
			@@failedSteps += 1 
			puts "Step failed: Check present: [Link: 'Web Projects']"
		end
		STDOUT.flush

		# user interaction: Click [Link: 'Web Projects']
		begin
			@link1.click
			@@passedSteps += 1 
		rescue
			puts "[-EXCEPTION-]>[Link: 'Web Projects'] -- " + $!
			@@failedSteps += 1 
			puts "Could not click [Link: 'Web Projects']"
			raise InteractionFailure
		end

		# asserting present: [Link: 'test']
		begin
			pass = 0
			@link2 = ie.link(:text, "test")
			while not @link2.exists? do
				if (pass > 20)
					raise TestStepFailed
				end
				sleep 0.1
				pass += 1
			end
			puts "[-PASS-]>[Link: 'test']"
			@@passedSteps += 1 
		rescue TestStepFailed
			puts "[-FAIL-]>[Link: 'test']"
			@@failedSteps += 1 
			puts "Step failed: Check present: [Link: 'test']"
		end
		STDOUT.flush

		# user interaction: Click [Link: 'test']
		begin
			@link2.click
			@@passedSteps += 1 
		rescue
			puts "[-EXCEPTION-]>[Link: 'test'] -- " + $!
			@@failedSteps += 1 
			puts "Could not click [Link: 'test']"
			raise InteractionFailure
		end

		# asserting present: [Link: 'Browse Website'] label = 'Browse Website', id = 'sandbox_browse_test--admin'
		begin
			pass = 0
			@link3 = ie.link(:xpath, "//a[normalize-space(text())='Browse Website' and @id='sandbox_browse_test--#{profile}']")
			while not @link3.exists? do
				if (pass > 20)
					raise TestStepFailed
				end
				sleep 0.1
				pass += 1
			end
			puts "[-PASS-]>[Link: 'Browse Website'] label = 'Browse Website', id = 'sandbox_browse_test--#{profile}'"
			@@passedSteps += 1 
		rescue TestStepFailed
			puts "[-FAIL-]>[Link: 'Browse Website'] label = 'Browse Website', id = 'sandbox_browse_test--#{profile}'"
			@@failedSteps += 1 
			puts "Step failed: Check present: [Link: 'Browse Website'] label = 'Browse Website', id = 'sandbox_browse_test--#{profile}'"
		end
		STDOUT.flush

		# user interaction: Click [Link: 'Browse Website'] label = 'Browse Website', id = 'sandbox_browse_test--admin'
		begin
			@link3.click
			@@passedSteps += 1 
		rescue
			puts "[-EXCEPTION-]>[Link: 'Browse Website'] label = 'Browse Website', id = 'sandbox_browse_test--#{profile}' -- " + $!
			@@failedSteps += 1 
			puts "Could not click [Link: 'Browse Website'] label = 'Browse Website', id = 'sandbox_browse_test--#{profile}'"
			raise InteractionFailure
		end
		
		# Call Reusable Methods
		# TODO these should become their own files
	  create_web_content_menu(ie)
		create_new_nav_form(ie, i, profile)

		if (@@failedSteps == 0)
			puts (@@passedSteps.to_s + " steps passed, no steps failed.")
		else
			puts(@@passedSteps.to_s + " steps passed, " + @@failedSteps.to_s + " steps failed!")
		end
		puts "[Test done]"
		puts "Press enter to exit"
		STDOUT.flush
		puts "Closing browser.."
		STDOUT.flush
	rescue InteractionFailure
		puts "There were failures during user interactions. Test was stopped."
	rescue
		puts "Unexpected error from Watir runner: " + $!
	end
	end
	
	def create_web_content_menu(ie)
  	# asserting [Context: 'DIV'] id = 'browse-sandbox:createMenu_1' present
		begin
			pass = 0
			@context0 = ie.element_by_xpath("//*[@id='browse-sandbox:createMenu_1']")
			while not @context0.methods.member?("ole_get_methods")
				if (pass > 20)
					raise TestStepFailed
				end
				sleep 0.1
				pass += 1
			end
			puts "[-PASS-]>[Context: 'DIV'] id = 'browse-sandbox:createMenu_1'"
			@@passedSteps += 1 
		rescue TestStepFailed
			puts "[-FAIL-]>[Context: 'DIV'] id = 'browse-sandbox:createMenu_1'"
			@@failedSteps += 1 
			puts "Step failed: Check [Context: 'DIV'] id = 'browse-sandbox:createMenu_1' present"
		end
		STDOUT.flush

		# asserting present: [Link: 'Create'] label begins with 'Create', href = '#'
		begin
			pass = 0
			@link4 = ie.link(:xpath, "//a[substring(normalize-space(text()), 0, string-length('Create') + 1) = 'Create' and @href='#']")
			while not @link4.exists? do
				if (pass > 20)
					raise TestStepFailed
				end
				sleep 0.1
				pass += 1
			end
			puts "[-PASS-]>[Link: 'Create'] label begins with 'Create', href = '#'"
			@@passedSteps += 1 
		rescue TestStepFailed
			puts "[-FAIL-]>[Link: 'Create'] label begins with 'Create', href = '#'"
			@@failedSteps += 1 
			puts "Step failed: Check present: [Link: 'Create'] label begins with 'Create', href = '#'"
		end
		STDOUT.flush

		# user interaction: Click [Link: 'Create'] label begins with 'Create', href = '#'
		begin
			@link4.click
			@@passedSteps += 1 
		rescue
			puts "[-EXCEPTION-]>[Link: 'Create'] label begins with 'Create', href = '#' -- " + $!
			@@failedSteps += 1 
			puts "Could not click [Link: 'Create'] label begins with 'Create', href = '#'"
			raise InteractionFailure
		end

		# asserting [Context: 'DIV'] id = 'browse-sandbox:createMenu_1' present
		begin
			pass = 0
			@context1 = ie.element_by_xpath("//*[@id='browse-sandbox:createMenu_1'][descendant-or-self::tr[2][descendant-or-self::a[@href='#']]]")
			while not @context1.methods.member?("ole_get_methods")
				if (pass > 20)
					raise TestStepFailed
				end
				sleep 0.1
				pass += 1
			end
			puts "[-PASS-]>[Context: 'DIV'] id = 'browse-sandbox:createMenu_1'--1336497"
			@@passedSteps += 1 
		rescue TestStepFailed
			puts "[-FAIL-]>[Context: 'DIV'] id = 'browse-sandbox:createMenu_1'--1336497"
			@@failedSteps += 1 
			puts "Step failed: Check [Context: 'DIV'] id = 'browse-sandbox:createMenu_1' present"
		end
		STDOUT.flush

		# asserting [Context: 'rowtwo'] element type = 'tr[2]' present
		begin
			pass = 0
			@context2 = ie.element_by_xpath("/descendant-or-self::*[@id='browse-sandbox:createMenu_1']/descendant-or-self::tr[2][descendant-or-self::a[@href='#']]")
			while not @context2.methods.member?("ole_get_methods")
				if (pass > 20)
					raise TestStepFailed
				end
				sleep 0.1
				pass += 1
			end
			puts "[-PASS-]>[Context: 'rowtwo'] element type = 'tr[2]'"
			@@passedSteps += 1 
		rescue TestStepFailed
			puts "[-FAIL-]>[Context: 'rowtwo'] element type = 'tr[2]'"
			@@failedSteps += 1 
			puts "Step failed: Check [Context: 'rowtwo'] element type = 'tr[2]' present"
		end
		STDOUT.flush

		# asserting present: [Link: 'createwebcontent'] href = '#'
		begin
			pass = 0
			@link5 = ie.link(:xpath, "/descendant-or-self::*[@id='browse-sandbox:createMenu_1']/descendant-or-self::tr[2]/descendant-or-self::a[@href='#']")
			while not @link5.exists? do
				if (pass > 20)
					raise TestStepFailed
				end
				sleep 0.1
				pass += 1
			end
			puts "[-PASS-]>[Link: 'createwebcontent'] href = '#'"
			@@passedSteps += 1 
		rescue TestStepFailed
			puts "[-FAIL-]>[Link: 'createwebcontent'] href = '#'"
			@@failedSteps += 1 
			puts "Step failed: Check present: [Link: 'createwebcontent'] href = '#'"
		end
		STDOUT.flush

		# user interaction: Click [Link: 'createwebcontent'] href = '#'
		begin
			@link5.click
			@@passedSteps += 1 
		rescue
			puts "[-EXCEPTION-]>[Link: 'createwebcontent'] href = '#' -- " + $!
			@@failedSteps += 1 
			puts "Could not click [Link: 'createwebcontent'] href = '#'"
			raise InteractionFailure
		end
  end
  
  def create_new_nav_form(ie, num, profile)
    
  	# asserting present: [TextField: 'wizard:wizard-body:file-name']
  		begin
  			pass = 0
  			@textfield1 = ie.text_field(:id, "wizard:wizard-body:file-name")
  			while not @textfield1.exists? do
  				if (pass > 20)
  					raise TestStepFailed
  				end
  				sleep 0.1
  				pass += 1
  			end
  			puts "[-PASS-]>[TextField: 'wizard:wizard-body:file-name']"
  			@@passedSteps += 1 
  		rescue TestStepFailed
  			puts "[-FAIL-]>[TextField: 'wizard:wizard-body:file-name']"
  			@@failedSteps += 1 
  			puts "Step failed: Check present: [TextField: 'wizard:wizard-body:file-name']"
  		end
  		STDOUT.flush

  		# asserting present: [Select: 'wizard:wizard-body:_idJsp35']
  		begin
  			pass = 0
  			@select0 = ie.select_list(:name, "wizard:wizard-body:_idJsp34")
  			while not @select0.exists? do
  				if (pass > 20)
  					raise TestStepFailed
  				end
  				sleep 0.1
  				pass += 1
  			end
  			puts "[-PASS-]>[Select: 'wizard:wizard-body:_idJsp34']"
  			@@passedSteps += 1 
  		rescue TestStepFailed
  			puts "[-FAIL-]>[Select: 'wizard:wizard-body:_idJsp34']"
  			@@failedSteps += 1 
  			puts "Step failed: Check present: [Select: 'wizard:wizard-body:_idJsp34']"
  		end
  		STDOUT.flush

  		# asserting present: [Option: 'navigation']
  		begin
  			if not @select0.methods.member?("select_value")
  				raise TestStepFailed
  			end
  			@select0.getAllContents().each do |optLabel|
  				if(optLabel == "navigation")
  					@option0 = optLabel
  				end
  			end
  			if (@option0 == nil)
  				raise TestStepFailed
  			end
  			puts "[-PASS-]>[Option: 'navigation']"
  			@@passedSteps += 1 
  		rescue TestStepFailed
  			puts "[-FAIL-]>[Option: 'navigation']"
  			@@failedSteps += 1 
  			puts "Step failed: Check present: [Option: 'navigation']"
  		end
  		STDOUT.flush

  		# asserting present: [Button: 'Next']
  		begin
  			pass = 0
  			@button1 = ie.button(:value, "Next")
  			while not @button1.exists? do
  				if (pass > 20)
  					raise TestStepFailed
  				end
  				sleep 0.1
  				pass += 1
  			end
  			puts "[-PASS-]>[Button: 'Next']"
  			@@passedSteps += 1 
  		rescue TestStepFailed
  			puts "[-FAIL-]>[Button: 'Next']"
  			@@failedSteps += 1 
  			puts "Step failed: Check present: [Button: 'Next']"
  		end
  		STDOUT.flush

  		# user interaction: Enter parameter text 'navigation1' [TextField: 'wizard:wizard-body:file-name']
  		begin
  			@textfield1.set("#{profile}-#{num}-navigation1")
  			@@passedSteps += 1 
  		rescue
  			puts "[-EXCEPTION-]>[TextField: 'wizard:wizard-body:file-name'] -- " + $!
  			@@failedSteps += 1 
  			puts "Could not set(\"navigation1\") [TextField: 'wizard:wizard-body:file-name']"
  			raise InteractionFailure
  		end

  		# user interaction: Select [Option: 'navigation']
  		begin
  			if (@option0.class == String)
  				@select0.select(@option0)
  			else
  				@option0.select
  			end
  			@@passedSteps += 1 
  		rescue
  			puts "[-EXCEPTION-]>[Option: 'navigation'] -- " + $!
  			@@failedSteps += 1 
  			puts "Could not select [Option: 'navigation']"
  			raise InteractionFailure
  		end

  		# user interaction: Click [Button: 'Next']
  		begin
  			@button1.click
  			@@passedSteps += 1 
  		rescue
  			puts "[-EXCEPTION-]>[Button: 'Next'] -- " + $!
  			@@failedSteps += 1 
  			puts "Could not click [Button: 'Next']"
  			raise InteractionFailure
  		end
 

		# asserting present: [TextField: 'input_0-widget']
		begin
			pass = 0
			@textfield2 = ie.text_field(:id, "input_0-widget")
			while not @textfield2.exists? do
				if (pass > 20)
					raise TestStepFailed
				end
				sleep 0.1
				pass += 1
			end
			puts "[-PASS-]>[TextField: 'input_0-widget']"
			@@passedSteps += 1 
		rescue TestStepFailed
			puts "[-FAIL-]>[TextField: 'input_0-widget']"
			@@failedSteps += 1 
			puts "Step failed: Check present: [TextField: 'input_0-widget']"
		end
		STDOUT.flush

		# asserting present: [TextField: 'input_1-widget']
		begin
			pass = 0
			@textfield3 = ie.text_field(:id, "input_1-widget")
			while not @textfield3.exists? do
				if (pass > 20)
					raise TestStepFailed
				end
				sleep 0.1
				pass += 1
			end
			puts "[-PASS-]>[TextField: 'input_1-widget']"
			@@passedSteps += 1 
		rescue TestStepFailed
			puts "[-FAIL-]>[TextField: 'input_1-widget']"
			@@failedSteps += 1 
			puts "Step failed: Check present: [TextField: 'input_1-widget']"
		end
		STDOUT.flush

		# asserting present: [Button: 'Finish']
		begin
			pass = 0
			@button2 = ie.button(:value, "Finish")
			while not @button2.exists? do
				if (pass > 20)
					raise TestStepFailed
				end
				sleep 0.1
				pass += 1
			end
			puts "[-PASS-]>[Button: 'Finish']"
			@@passedSteps += 1 
		rescue TestStepFailed
			puts "[-FAIL-]>[Button: 'Finish']"
			@@failedSteps += 1 
			puts "Step failed: Check present: [Button: 'Finish']"
		end
		STDOUT.flush

		# user interaction: Set focus [TextField: 'input_0-widget']
		begin
			@textfield2.fireEvent("onfocus")
			@@passedSteps += 1 
		rescue
			puts "[-EXCEPTION-]>[TextField: 'input_0-widget'] -- " + $!
			@@failedSteps += 1 
			puts "Could not fireEvent(\"onfocus\") [TextField: 'input_0-widget']"
			raise InteractionFailure
		end

		# user interaction: Click [TextField: 'input_0-widget']
		begin
			@textfield2.click
			@@passedSteps += 1 
		rescue
			puts "[-EXCEPTION-]>[TextField: 'input_0-widget'] -- " + $!
			@@failedSteps += 1 
			puts "Could not click [TextField: 'input_0-widget']"
			raise InteractionFailure
		end

		# user interaction: Enter parameter text 'navigation1' [TextField: 'input_0-widget']
		begin
			@textfield2.set("navigation1")
			@@passedSteps += 1 
		rescue
			puts "[-EXCEPTION-]>[TextField: 'input_0-widget'] -- " + $!
			@@failedSteps += 1 
			puts "Could not set(\"navigation1\") [TextField: 'input_0-widget']"
			raise InteractionFailure
		end

		# user interaction: Remove focus [TextField: 'input_0-widget']
		begin
			@textfield2.fireEvent("onblur")
			@@passedSteps += 1 
		rescue
			puts "[-EXCEPTION-]>[TextField: 'input_0-widget'] -- " + $!
			@@failedSteps += 1 
			puts "Could not fireEvent(\"onblur\") [TextField: 'input_0-widget']"
			raise InteractionFailure
		end

		# user interaction: Set focus [TextField: 'input_1-widget']
		begin
			@textfield3.fireEvent("onfocus")
			@@passedSteps += 1 
		rescue
			puts "[-EXCEPTION-]>[TextField: 'input_1-widget'] -- " + $!
			@@failedSteps += 1 
			puts "Could not fireEvent(\"onfocus\") [TextField: 'input_1-widget']"
			raise InteractionFailure
		end

		# user interaction: Click [TextField: 'input_1-widget']
		begin
			@textfield3.click
			@@passedSteps += 1 
		rescue
			puts "[-EXCEPTION-]>[TextField: 'input_1-widget'] -- " + $!
			@@failedSteps += 1 
			puts "Could not click [TextField: 'input_1-widget']"
			raise InteractionFailure
		end

		# user interaction: Enter parameter text 'nav1desc' [TextField: 'input_1-widget']
		begin
			@textfield3.set("nav1desc")
			@@passedSteps += 1 
		rescue
			puts "[-EXCEPTION-]>[TextField: 'input_1-widget'] -- " + $!
			@@failedSteps += 1 
			puts "Could not set(\"nav1desc\") [TextField: 'input_1-widget']"
			raise InteractionFailure
		end

		# user interaction: Remove focus [TextField: 'input_1-widget']
		begin
			@textfield3.fireEvent("onblur")
			@@passedSteps += 1 
		rescue
			puts "[-EXCEPTION-]>[TextField: 'input_1-widget'] -- " + $!
			@@failedSteps += 1 
			puts "Could not fireEvent(\"onblur\") [TextField: 'input_1-widget']"
			raise InteractionFailure
		end

		# user interaction: Click [Button: 'Finish']
		begin
			@button2.click
			@@passedSteps += 1 
		rescue
			puts "[-EXCEPTION-]>[Button: 'Finish'] -- " + $!
			@@failedSteps += 1 
			puts "Could not click [Button: 'Finish']"
			raise InteractionFailure
		end
		ie.wait
  
  end
  
end


#user registration form
Feature: Register a New Account
   As a new user trying to access the full site
   So that I can sign up for rides and post ride offers
   I want to sign up as a registered user

Background: 
    When I am on the BURideShare home page
    
Scenario: Successfully sign up for an account.
    When I follow "Sign up"
	Then I fill in "First Name" with "Magie"
	And I fill in "Last Name" with "Wu"
	Then I fill in "E-Mail Address" with "XXXXXXX@binghamton.edu"
	And I fill in "Password" with "123456"
	And I fill in "password_confirmation" with "123456"
	And I press "Register"
	Then I am on the BURideShare home page

 Scenario: Fail due to mismatched password.
	Then I follow "Sign up"
 	Then I fill in "First Name" with "Magie"
 	And I fill in "Last Name" with "Wu"
	Then I fill in "E-Mail Address" with "XXXXXXX@binghamton.edu"
 	And I fill in "Password" with "123456"
 	And I fill in "password_confirmation" with "1236"
 	And I press "Register"
 	#Then I should see "The password fields don't match." 
 	Then I am on the new_user page
 	And I should see "The password fields don't match."

Scenario: Fail due to an invalid email.
	When I follow "Sign up"
	Then I fill in "First Name" with "Magie"
	And I fill in "Last Name" with "Wu"
	Then I fill in "E-Mail Address" with "XXXXXXX@binghaton.edu"
	And I fill in "Password" with "123456"
	And I fill in "password_confirmation" with "123456"
	And I press "Register"
	#Then I should see "The provided e-mail address is invalid." 
	Then I am on the new_user page
	And I should see "The email must end with @binghamton.edu"
  
 Scenario: Fail due to blank textboxes.
	Then I follow "Sign up"
	Then I fill in "First Name" with " "
	And I fill in "Last Name" with "Wu"
	Then I fill in "E-Mail Address" with "XXXXXXX@binghamton.edu"
	And I fill in "Password" with "123456"
	And I fill in "password_confirmation" with "123456"
	And I press "Register"
	Then I should see "field is empty"

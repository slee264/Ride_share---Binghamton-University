#user registration form
Feature: Register a New Account
   As a new user trying to access the full site
   So that I can sign up for rides and post ride offers
   I want to sign up as a registered user

Background: 
    When I am on the BURideShare home page
    
Scenario: Successfully sign up for an account.
    When I follow "Sign up"
	Then I fill in "user_first_name" with "Magie"
	And I fill in "user_last_name" with "Wu"
	Then I fill in "user_email" with "XXXXXXX@binghamton.edu"
	And I fill in "user_password" with "1234567"
	And I fill in "post_password_confirmation" with "1234567"
	And I press "Register"
	And I should see "You have registered successfully!"

 Scenario: Fail due to mismatched password.
	Then I follow "Sign up"
 	Then I fill in "user_first_name" with "Magie"
 	And I fill in "user_last_name" with "Wu"
	Then I fill in "user_email" with "XXXXXXX@binghamton.edu"
 	And I fill in "user_password" with "1234567"
 	And I fill in "post_password_confirmation" with "1236"
 	And I press "Register"
 	And I should see "The password fields don't match."
 	Then I follow "Try Again"
 	Then I am on the new_user page

Scenario: Fail due to an invalid email.
	When I follow "Sign up"
	Then I fill in "user_first_name" with "Magie"
	And I fill in "user_last_name" with "Wu"
	Then I fill in "user_email" with "XXXXXXX@binghaton.edu"
	And I fill in "user_password" with "123456"
	And I fill in "post_password_confirmation" with "123456"
	And I press "Register"
	And I should see "Must use Binghamton e-mail address."
	Then I follow "Try Again"
 	Then I am on the new_user page
  
 Scenario: Fail due to blank textboxes.
	Then I follow "Sign up"
	Then I fill in "user_first_name" with " "
	And I fill in "user_last_name" with "Wu"
	Then I fill in "user_email" with "XXXXXXX@binghamton.edu"
	And I fill in "user_password" with "123456"
	And I fill in "post_password_confirmation" with "123456"
	And I press "Register"
	Then I should see "One or more fields is empty"
	Then I follow "Try Again"
	Then I am on the new_user page
	
 Scenario: Fail due to short password.
	Then I follow "Sign up"
 	Then I fill in "user_first_name" with "Magie"
 	And I fill in "user_last_name" with "Wu"
	Then I fill in "user_email" with "XXXXXXX@binghamton.edu"
 	And I fill in "user_password" with "1234"
 	And I fill in "post_password_confirmation" with "1234"
 	And I press "Register"
 	Then I should see "The password must be 7 characters or more."
 	Then I follow "Try Again"
 	Then I am on the new_user page

Feature: Log the user in to the website
  
  As a registered user wanting to log in to the web site
  So that I can be active on the site
  I want to be able to post rides and look for rides
  
Background:
  When I am on the BURideShare home page
  
Scenario: Log in successfully
  When I follow "Log in"
  Then I fill in "session[email]" with "mprice3@binghamton.edu"
  When I fill in "session[password]" with "garbage"
  And I press "Log in"
  And I should see "Welcome mprice3!"
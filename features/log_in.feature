Feature: Log the user in to the website
  
  As a registered user wanting to log in to the web site
  So that I can be active on the site
  I want to be able to post rides and look for rides
  
Background: users have been added to database
  
  Given the following users exist:
	  
		| first_name  | last_name | email                 | password          |
	  | Matthew     | Price     | mprice3@binghamton.edu| goodmusic         |          
		| Joe         | Lee       | slee264@binghamton.edu| goodmusic         |
  
  And I am on the BURideShare home page
  
Scenario: User logs in with right email address and password
  
  When I follow "Log in"
  Then I fill in "E-Mail Address" with "mprice3@binghamton.edu"
  When I fill in "Password" with "goodmusic"
  And I press "Log in"
  And I should see "Welcome mprice3!"
  
Scenario: User logs in  
  
  When I follow "Log in"
  And I press "Log in"
  And I should see "Invalid email/password combination"
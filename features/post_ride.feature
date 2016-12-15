Feature: Post a ride offer to the website 
  
  As a registered user wanting to post a ride offer
  So that I can post the departure&destination location and leaving time
  I want to be able to post a ride with the above info.
  
Background: 
    When I am on the BURideShare home page
    Given the following users exist:
	  
	| first_name  | last_name | email                 | password          |
	| Matthew     | Price     | mprice3@binghamton.edu| goodmusic         |          
	| Joe         | Lee       | slee264@binghamton.edu| goodmusic         |
	| Curious     | George    | cgeorge@binghamton.edu| curious           |
  
  When I follow "Log in"
  Then I fill in "E-Mail Address" with "cgeorge@binghamton.edu"
  When I fill in "Password" with "curious"
  And I press "Log in"
  And I should see "Welcome cgeorge!"
  And I follow "Go To Home Page"
# and steps should be added to check if user is signed in
    
Scenario: As a logged in user, post the ride by selecting from the dropdown boxes
   Then I should see "Log out"
   When I follow "Post a Ride"
   Then I select "Allegany County" from "ride_departure_location"
   When I select "Bronx County" from "ride_destination_location"
   When I select "2017" from "ride_date_and_time_1i"
   When I select "September" from "ride_date_and_time_2i"
   When I select "26" from "ride_date_and_time_3i"
   When I select "20" from "ride_date_and_time_4i"
   When I select "58" from "ride_date_and_time_5i"
   And I press "Post"
   And I should see "Allegany County"
   And I should see "Bronx County"
   And I should see "2017"
   And I should see "September"
   And I should see "26"
   And I should see "20"
   And I should see "58"
   
Scenario: As a logged in user, user doesn't select fields from drop down boxes
   When I follow "Post a Ride"
   Then I select "Allegany County" from "ride_departure_location"
   When I select "Bronx County" from "ride_destination_location"
   When I select "Year" from "ride_date_and_time_1i"
   When I select "Month" from "ride_date_and_time_2i"
   When I select "Day" from "ride_date_and_time_3i"
   When I select "Hour" from "ride_date_and_time_4i"
   When I select "Minute" from "ride_date_and_time_5i"
   And I press "Post"
   And I should see "You need to select all the fields."
   
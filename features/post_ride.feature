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
    And I fill in "ride_datepicker" with "9/23/2017"
    And I fill in "ride_timepicker" with "3:30 pm"
    And I press "Post"
    And I should see "Allegany County"
    And I should see "Bronx County"
    And I should see "September 23, 2017"
    And I should see "3:30 PM"
   
Scenario: As a logged in user, user doesn't select fields from drop down boxes
    When I follow "Post a Ride"
    Then I select "Allegany County" from "ride_departure_location"
    And I fill in "ride_datepicker" with "10/12/2017"
    And I fill in "ride_timepicker" with "11:45 am"
    And I press "Post"
    And I should see "You need to select all the fields."
    
Scenario: As a logged in user, user enters invalid date format
    When I follow "Post a Ride"
    Then I select "Allegany County" from "ride_departure_location"
    And I select "Bronx County" from "ride_destination_location"
    And I fill in "ride_datepicker" with "cheese"
    And I fill in "ride_timepicker" with "3:30 pm"
    And I press "Post"
    And I should see "Improper date format! Format should be MM/DD/YYYY."

Scenario: As a logged in user, user enters invalid month value (in a valid date format)
    When I follow "Post a Ride"
    Then I select "Allegany County" from "ride_departure_location"
    And I select "Bronx County" from "ride_destination_location"
    And I fill in "ride_datepicker" with "17/12/2017"
    And I fill in "ride_timepicker" with "3:30 pm"
    And I press "Post"
    And I should see "Improper date format! There is no month #17!"

Scenario: As a logged in user, user enters invalid day value (in a valid date format)
    When I follow "Post a Ride"
    Then I select "Allegany County" from "ride_departure_location"
    And I select "Bronx County" from "ride_destination_location"
    And I fill in "ride_datepicker" with "10/35/2017"
    And I fill in "ride_timepicker" with "3:30 pm"
    And I press "Post"
    And I should see "Improper date format! There is no day #35!"

Scenario: As a logged in user, user enters a plausable but non-existant day value (Feb 30) (in a valid date format)
    When I follow "Post a Ride"
    Then I select "Allegany County" from "ride_departure_location"
    And I select "Bronx County" from "ride_destination_location"
    And I fill in "ride_datepicker" with "2/30/2017"
    And I fill in "ride_timepicker" with "3:30 pm"
    And I press "Post"
    And I should see "Improper date format!"

Scenario: As a logged in user, user enters invalid time format
    When I follow "Post a Ride"
    Then I select "Allegany County" from "ride_departure_location"
    And I select "Bronx County" from "ride_destination_location"
    And I fill in "ride_datepicker" with "10/12/2017"
    And I fill in "ride_timepicker" with "goat"
    And I press "Post"
    And I should see "Improper time format! Format should be HH:MM AM."

Scenario: As a logged in user, user enters invalid hour value (in a valid time format)
    When I follow "Post a Ride"
    Then I select "Allegany County" from "ride_departure_location"
    And I select "Bronx County" from "ride_destination_location"
    And I fill in "ride_datepicker" with "10/12/2017"
    And I fill in "ride_timepicker" with "15:30 pm"
    And I press "Post"
    And I should see "Improper time format! There is no 15 o'clock!"

Scenario: As a logged in user, user enters invalid minute value (in a valid time format)
    When I follow "Post a Ride"
    Then I select "Allegany County" from "ride_departure_location"
    And I select "Bronx County" from "ride_destination_location"
    And I fill in "ride_datepicker" with "10/12/2017"
    And I fill in "ride_timepicker" with "3:70 pm"
    And I press "Post"
    And I should see "Improper time format! You can't have 70 as a minute value!"
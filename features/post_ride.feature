Feature: Post a ride offer to the website 
  
  As a registered user wanting to post a ride offer
  So that I can post the departure&destination location and leaving time
  I want to be able to post a ride with the above info.
  
Background: 
    When I am on the BURideShare home page
    
Scenario: Post the ride by selecting from the dropdown boxes
   #choose from select box
   When I follow "Post a Ride"
   #In the rides/new, its called Departure Location: but the following still works???
   Then I select "Allegany County" from "ride_departure_location"
   When I select "Bronx County" from "ride_destination_location"
   When I select "2017" from "ride_dateAndTime_1i"
   When I select "September" from "ride_dateAndTime_2i"
   When I select "26" from "ride_dateAndTime_3i"
   When I select "20" from "ride_dateAndTime_4i"
   When I select "58" from "ride_dateAndTime_5i"
   And I press "Post"
   And I should see "Allegany County"
   And I should see "Bronx County"
   And I should see "2017"
   And I should see "September"
   And I should see "26"
   And I should see "20"
   And I should see "58"
   
Scenario: User doesn't select fields from drop down boxes
   When I follow "Post a Ride"
   Then I select "Allegany County" from "ride_departure_location"
   When I select "Bronx County" from "ride_destination_location"
   When I select "Year" from "ride_dateAndTime_1i"
   When I select "Month" from "ride_dateAndTime_2i"
   When I select "Day" from "ride_dateAndTime_3i"
   When I select "Hour" from "ride_dateAndTime_4i"
   When I select "Minute" from "ride_dateAndTime_5i"
   And I press "Post"
   And I should see "You need to select all the fields."
   
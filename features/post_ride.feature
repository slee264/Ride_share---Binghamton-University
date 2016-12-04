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
   Then I select "Allegany County" from "Departure Location"
   When I select "Bronx County" from "Destination Location"
   #select box for date?
   When I select "2013" from "ride_dateAndTime_1i"
   When I select "September" from "ride_dateAndTime_2i"
   When I select "26" from "ride_dateAndTime_3i"
   When I select "20" from "ride_dateAndTime_4i"
   When I select "58" from "ride_dateAndTime_5i"
   And I press "Post"
   Then I am on the rides page
   #need to implement 
   And I should see "Kings County"
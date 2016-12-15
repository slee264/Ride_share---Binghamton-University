#search a location/destination, get a list of rides

Feature: display list of rides for a specific location

	As a registered user looking for rides
	So that I can see all the available postings for the destination I want to go to
	I want to search my destination and see all the available rides to it

Background: locations have been added to database

	Given the following locations exist:
	  
		| departure_location | destination_location| dateAndTime			  |
	    | Albany County      | Allegany County     | 31-Oct-2016     10:05    |          
		| Allegany County    | Bronx County        | 1-Nov-2016      0:10     |
		| Bronx County       | Broome County       | 2-Nov-2016      11:30    |
		| Broome County      | Cattaraugus County  | 3-Nov-2016      1:45     |
		| Cattaraugus County | Cayuga County       | 4-Nov-2016      5:20     |
		| Kings County		 | Chautauqua County   | 5-Nov-2016      3:15     |
			  
	And I am on the BURideShare home page

Scenario: redirect to rides page when destination is searched 

	When I select "Albany County" from "Departure Location"
	And I select "Allegany County" from "Destination Location"
	And I fill in "search_datepicker" with "10/31/2016"
	And I press "Search"
	Then I should see "2016"
	And I should see "10"
	And I should see "31"
	And I should see "Albany County"
	And I should see "Allegany County"

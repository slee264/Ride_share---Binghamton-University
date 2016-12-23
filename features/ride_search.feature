#search a location/destination, get a list of rides

Feature: display list of rides for a specific location

	As a registered user looking for rides
	So that I can see all the available postings for the destination I want to go to
	I want to search my destination and see all the available rides to it

Background: locations have been added to database

	Given the following locations exist:
	  
		| departure_location | destination_location| date_and_time			  |
	    | Albany County      | Allegany County     | 19-Dec-2016     20:00  |          
		| Allegany County    | Bronx County        | 1-Nov-2016      0:10     |
		| Bronx County       | Broome County       | 2-Nov-2016      11:30    |
		| Broome County      | Cattaraugus County  | 3-Nov-2016      1:45     |
		| Cattaraugus County | Cayuga County       | 4-Nov-2016      5:20     |
		| Kings County		 | Chautauqua County   | 5-Nov-2016      3:15     |
			  
	And I am on the BURideShare home page

Scenario: Departure location/destination location is not filled in
  
	When I select "Departure" from "Departure Location"
	And I select "Destination" from "Destination Location"
	And I fill in "search_datepicker" with "12/19/2016"
	And I press "Search"
	Then I should see "You need to select all the fields!"

Scenario: redirect to rides page when destination is searched successfully

	When I select "Albany County" from "Departure Location"
	And I select "Allegany County" from "Destination Location"
	And I fill in "search_datepicker" with "12/19/2016"
	And I press "Search"
#	Then I should see "mprice3@binghamton.edu"
	#Then I should see "Albany County" in "ride_search_results"
	#And I should see "Allegany County"
	#And I should see "2016"
	#And I should see "December"
	#And I should see "19"
	#And I should see "15"
	#And I should see "00"
	#And I should see "PM"
	Then I should see the following (#ride_search_results)
		| mprice3@binghamton.edu | Albany County | Allegany County | 2016 | 12 | 19 | 01 | 00 | PM |
		 
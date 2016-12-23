Given /^I am logged in/ do
	#email = 'mprice3@binghamton.edu'
	#password = 'goodmusic'

	#visit login_path
	
	#fill_in("Password", :with => password)
	#click_button "Post a Ride"
	#expect(page).to have_text("Welcome mprice3!")
end

Then(/^I should see the following \(\#ride_search_results\)$/) do |table|
  table_results = page.find('#ride_search_results')
end

Then /^I should see the following$/ do |text|
	expect(page).to have_css('ride_search_results', text: 'Albany County')
end

Given /the following locations exist/ do |rides_table|
	
	# p rides_table
	rides_table.hashes.each do |ride|

		Ride.create!(ride)
	end
	
	# Ride.all.each do |ride|
	# 	p ride
	# end
	# p Ride.all
	# p Ride.all
	
end

Given /the following users exist/ do |users_table|
	
	users_table.hashes.each do |user|
		User.create!(user)
	end
end


Then /^(?:|I )should only see the following counties: (.*)$/ do |counties|
	specified_counties = counties.split(', ')
	all_counties = Ride.all_NYcounties
	# p specified_counties
	# p all_counties
	#Ensure only valid counties are listed
	#specified_counties.each { |c| fail unless all_counties.include? c } 
	
	all_counties.each do |c|
		if specified_counties.include? c
			steps %Q{I should see "#{c}"}
		else
			steps %Q{I should not see "#{c}"} 
		end
	end
end


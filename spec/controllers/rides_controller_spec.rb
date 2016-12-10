require 'rails_helper'

describe RidesController do
    render_views
    
    describe 'post a ride' do
        
            it 'posts a ride' do
                post :create, {:ride => {"departure_location" => "Bronx County", "destination_location" => "Broome County", "dateAndTime(1i)" => "2016", "dateAndTime(2i)" => "3", "dateAndTime(3i)" => "3", "dateAndTime(4i)" => "12", "dateAndTime(5i)" => "44"}}
                assert_template 'rides/create'
                assert_select "h2", "Departure Location: Bronx County"
                assert_select "h2", "Destination Location: Broome County"
                assert_select "h2", "Year: 2016"
                assert_select "h2", "Month: March"
                assert_select "h2", "Date: 3"
                assert_select "h2", "Hour: 12"
                assert_select "h2", "Minute: 44"
            end
            
            it 'fails to post a ride if user does not select anything' do
                post :create, {:ride => {"departure_location" => "Bronx County", "destination_location" => "Broome County", "dateAndTime(1i)" => "", "dateAndTime(2i)" => "", "dateAndTime(3i)" => "", "dateAndTime(4i)" => "", "dateAndTime(5i)" => ""}}
                assert_template 'rides/create'
                assert_select "h2", "You need to select all the fields."
            end
    end
    
    describe 'search for rides' do
        
        it 'searches for a ride' do
            post :search, {:search => {"departure" => "Allegany County", "destination" => "Columbia County", "date(1i)" => 2017, "date(2i)" => 10, "date(3i)" => 29}}
            assert_tag :tag => 'h2'
        end
    end
end
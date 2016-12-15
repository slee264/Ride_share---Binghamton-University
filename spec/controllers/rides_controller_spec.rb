require 'rails_helper'

RSpec.describe RidesController, type: :controller do
    render_views
    
    describe 'post a ride' do
        
            it 'posts a ride' do
                
                @ridesController = RidesController.new
                @ridesController.instance_variable_set(:@name, 'slee264@binghamton.edu')
                
                post :create, {:ride => {"departure_location" => "Allegany County", "destination_location" => "Columbia County", "date" => '1/1/2017', "time" => '1:00 pm'}}
                assert_template 'rides/create'
                assert_select "h2", "Your ride has been posted."
            end
            
            it 'fails to post a ride if user does not select anything' do
                post :create, {:ride => {"departure_location" => "Allegany County", "destination_location" => "Columbia County", "date" => '1/1/2017', "time" => ''}}
                assert_template 'rides/create'
                assert_select 'h1', 'You need to select all the fields.'
            end
    end
    
    describe 'search for rides' do
        it 'searches for a ride' do
            
            @ridesController = RidesController.new
            @ridesController.instance_variable_set(:@name, 'slee264@binghamton.edu')
            
            post :create, {:ride => {"departure_location" => "Allegany County", "destination_location" => "Columbia County", "date" => '1/1/2017', "time" => '1:00 pm'}}
            post :create, {:ride => {"departure_location" => "Allegany County", "destination_location" => "Columbia County", "date" => '1/1/2017', "time" => '2:00 pm'}}
            
            get :search, {:search => {"departure" => "Allegany County", "destination" => "Columbia County", "date" => '1/1/2017'}}
            
            assert_select 'tr' do |elements|
                assert_select 'td', 'From'
                assert_select 'td', 'To'
                assert_select 'td', 'Year'
                assert_select 'td', 'Month'
                assert_select 'td', 'Day'
                assert_select 'td', 'Hour'
                assert_select 'td', 'Minute'
                assert_select 'td', 'Time'
            end
        end
        
        it 'searches for a ride with at least one empty field' do
            get :search, {:search => {"departure" => "", "destination" => "Columbia County", "date(1i)" => 2017, "date(2i)" => 10, "date(3i)" => 29}}
            assert_select "h1", "You need to select all the fields!"
        end
    end
end

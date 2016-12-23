require 'rails_helper'

RSpec.describe RidesController, type: :controller do
    render_views
    
    describe 'post a ride' do
        
            it 'posts a ride' do
                
                @ridesController = RidesController.new
                #@ridesController.instance_variable_set(:@name, 'slee264@binghamton.edu')
                test = post :create, {:ride => {"departure_location" => "Allegany County", "destination_location" => "Columbia County", "date" => '1/1/2017', "time" => '1:00 pm'}}
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
        it 'searches for a ride that exists' do
            
            @ridesController = RidesController.new
            #@ridesController.instance_variable_set(:@name, 'mprice3@binghamton.edu')
            @test = post :create, {:ride => {"departure_location" => "Allegany County", "destination_location" => "Columbia County", "date" => '12/22/2016', "time" => '1:00 pm', "poster_user_id" => 11}}
            post :create, {:ride => {"departure_location" => "Allegany County", "destination_location" => "Columbia County", "date" => '12/22/2016', "time" => '2:00 pm', "poster_user_id" => 13}}
            get :search, {:search => {"departure" => "Allegany County", "destination" => "Columbia County", "date" => '12/22/2016'}}
            assert_select 'h1', 'Search Results'
            assert_select 'tr' do |elements|
                #"td".should be_an_instance_of(Integer)
                #assert_select ride[:poster_user_id], 11
                assert_select 'td', 'Allegany County'
                assert_select 'td', 'Columbia County'
                assert_select 'td', '2016'
                assert_select 'td', 'December'
                assert_select 'td', '22'
                assert_select 'td', '01'
                assert_select 'td', '00'
                assert_select 'td', 'PM'
            end
            assert_select 'tr' do |elements|
                #"td".should be_an_instance_of(Integer)
                #assert_select ride[:poster_user_id], 13
                assert_select 'td', 'Allegany County'
                assert_select 'td', 'Columbia County'
                assert_select 'td', '2016'
                assert_select 'td', 'December'
                assert_select 'td', '22'
                assert_select 'td', '02'
                assert_select 'td', '00'
                assert_select 'td', 'PM'
            end
        end
        
        it 'searches for a ride with at least one empty field' do
            get :search, {:search => {"departure" => "", "destination" => "Columbia County", "date(1i)" => 2017, "date(2i)" => 10, "date(3i)" => 29}}
            assert_select "h1", "You need to select all the fields!"
        end
        
        it 'searches for a ride that does not exist in the db' do
           
        end
    end
end

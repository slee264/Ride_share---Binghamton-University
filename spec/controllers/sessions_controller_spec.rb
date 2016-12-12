require 'rails_helper'

RSpec.describe SessionsController, type: :controller do
    render_views
    describe 'login as a user' do
        
        it 'fails to login a user with one or more blank field' do
            post :create, {:session => {:email =>' ', :password => ''}}
            assert_select "h2", "One or more of the text fields are blank"
        end
        
        it 'sign in successfully' do
            post :create, {:session => {:email => 'mwu29@binghamton.edu', :password => '1234567'}}
            assert_select "h2", "Welcome mwu29!"
        end
    end
end

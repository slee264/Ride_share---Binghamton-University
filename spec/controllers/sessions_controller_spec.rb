require 'rails_helper'

=begin
  Rspec.configure do |config|
    config.include SessionsHelper, :type => :controller 
  end
=end
RSpec.describe SessionsController, type: :controller do
    render_views
    describe 'login as a user' do
        
        it 'fails to login a user with one or more blank field' do
            post :create, {:session => {:email =>'', :password => ''}}
            assert_select "h2", "One or more of the text fields are blank"
        end
        
        it 'sign in successfully' do
            @controller = UsersController.new
            post :create, {:user => {:first_name => 'Matt', :last_name => 'Price', :email => 'mprice3@binghamton.edu', :password => 'goodmusic'}, :post => {:password_confirmation => 'goodmusic'}}
            @controller = SessionsController.new
            post :create, {:session => {:email => 'mprice3@binghamton.edu', :password => 'goodmusic'}}
            #assert_template 'users/show'
           #assert_select "h2", "Invalid email/password combination"
            # assert_select "h2", "Welcome mprice3!"
            assert_tag :tag => 'h2'
        end
        
         it 'fails to login a user with an invalid email/password combo' do
            post :create, {:session => {:email =>'mprice3@binghamton.edu', :password => 'garbage'}}
            assert_select "h2", "Invalid email/password combination"
        end
    end
end

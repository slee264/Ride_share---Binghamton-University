require 'rails_helper'

describe UsersController do
    describe 'register a user' do
        it 'calls the model method to perform registration' do
           post :create, {:user => {:first_name => 'Joe', :last_name => 'Lee', :email => 'slee264@binghamton.edu', :password => '123456'}, :password_confirmation => '123456'}
        end
        
        it 'selects the User Registration template for redering' do
            
        end
        
        it 'makes the registration results avilable to the template'
    end
end
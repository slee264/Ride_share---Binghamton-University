require 'rails_helper'

describe UsersController do
    render_views
    
    describe 'register a user' do
        
        it 'fails to register a user with a blank field' do
            post :create, {:user => {:first_name => '', :last_name => 'Lee', :email => 'slee264@binghamton.edu', :password => '1234567'}, :post => {:password_confirmation => '1234567'}}
            assert_template 'users/create'
            expect(assigns(:success)).to be_falsey
            assert_select "h2", "One or more fields is empty."
            
        end
        it 'fails to register a user with a password less than 7 characters' do
            post :create, {:user => {:first_name => 'Joe', :last_name => 'Lee', :email => 'slee264@binghamton.edu', :password => '123456'}, :post => {:password_confirmation => '123456'}}
            assert_template 'users/create'
            expect(assigns(:success)).to be_falsey
            assert_select "h2", "The password must be 7 characters or more."
        end
        
        it 'fails to register a user with unmatching password and password_confirmation' do
            post :create, {:user => {:first_name => 'Joe', :last_name => 'Lee', :email => 'slee264@binghamton.edu', :password => '1234567'}, :post => {:password_confirmation => '12345'}}
            assert_template 'users/create'
            expect(assigns(:success)).to be_falsey
            assert_select "h2", "The password fields don't match."
        end
        
        it 'fails to register a user with an incorrect email' do
            post :create, {:user => {:first_name => 'Matt', :last_name => 'Price', :email => 'mprice3@gmail.com', :password => '1234'}, :post => {:password_confirmation => '1234'}}
            assert_template 'users/create'
            expect(assigns(:success)).to be_falsey
            assert_select "h2", "Must use Binghamton e-mail address."
        end
        
        it 'registers a user successfully' do
            before_count = User.count
            post :create, {:user => {:first_name => 'Joe', :last_name => 'Lee', :email => 'slee264@binghamton.edu', :password => '1234567'}, :post => {:password_confirmation => '1234567'}}
            assert_template 'users/create'
            expect(assigns(:success)).to be_truthy
            expect(assigns(:notExist)).to be_truthy
            expect(assigns(:message)).to be_nil
            expect(User.count).to_not eq(before_count)
            assert_select "h1", 'You have successfully registered!!!'
        end

        # it 'fails to register a user if they already exist in db' do
        #     before_count = User.count
        #     post :create, {:user => {:first_name => 'Joe', :last_name => 'Lee', :email => 'slee264@binghamton.edu', :password => '1234567'}, :post => {:password_confirmation => '1234567'}}
        #     assert_template 'users/create'
        #     expect(assigns(:success)).to be_falsey
        #     expect(assigns(:notExist)).to be_falsey
        #     expect(User.count).to eq(before_count)   
        #     assert_tag :tag => 'h2'
        # end
    end


end
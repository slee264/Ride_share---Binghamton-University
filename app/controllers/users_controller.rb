class UsersController < ApplicationController
   # this controller method creates a new user during registration
   
   # please set @success to true or false, and set the value of @message to the
   # appropriate value. Note that if a field is empty, you should call
   #            @@BLANK_FIELD_MESSAGE % field_name
   # to return a new string with the appropriate field name filled in.
   
   @@SUCCESS_MESSAGE = 'New account successfully created.'
   @@PASSWORD_DIFFERENT_MESSAGE = "The password fields don't match. Please try again."
   @@INVALID_EMAIL_MESSAGE = 'The provided e-mail address is invalid. Please enter a valid Binghamton University e-mail address and try again.'
   @@BLANK_FIELD_MESSAGE = "The %s field is empty. Please make sure all fields are filled in and try again"
   @@LENGTH_MESSAGE = ""
   def index
   
   end

   def new
      @user = User.new
   end
   
   def user_params
      params.require(:user).permit(:first_name, :last_name, :email, :password, :password_confirmation)
   end
   
   def create
      @success = true
      if(params[:password] != params[:password_confirmation])
         @success = false
         @message = @@PASSWORD_DIFFERENT_MESSAGE
      end
      if !(params[:firstName].present? || params[:lastName].present? || params[:email].present? || params[:password].present? || params[:password_confirmation].present?)
         @success = false
         @message = "One or more of the fields is blank."
      end
=begin
      if not .end_with? '@binghamton.edu'
         @success = false
         @message = "Must use Binghamton e-mail address."
      end
=end
      if(params[:password].length < 6 || params[:firstName].length > 20 || params[:lastName].length > 20)
         @success = false
         @message = "The length of one of the fields is too short."
      end
      User.create!(user_params)
      
   end
   
   def destroy
      # #destroy one user
      # User.destroy
      # #destroy multiple users
      # User.where(:id => #id).destroy_all
   
   end
   
   def edit
      #@user = current_user
   end
   
   def show
      
   end
   
   def update
=begin
      @user = current_user
    if @user.update_attributes(params[:user])
      redirect_to users_path, :notice => "Your profile has been updated."
    else
      render :action => 'edit'
    end
=end
   end
end
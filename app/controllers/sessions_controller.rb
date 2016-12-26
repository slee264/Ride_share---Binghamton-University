class SessionsController < ApplicationController
  def new
    
  end
  
  def create
    user = User.find_by(email: params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
    if user.email_confirmed  
      log_in user
      redirect_to user
    elsif !(user.email_confirmed)
      flash[:danger] = 'Please activate your account by following the 
      instructions in the account confirmation email you received to proceed'
      render 'new'
    end
    if (params[:session][:email] == "" || params[:session][:password] == "")
      flash[:danger] = 'One or more of the text fields are blank'
      render 'new'
    end
    else
      flash[:danger] = 'Invalid email/password combination'
      render 'new'
    end
  end
  
  def destroy
    session[:user_id] = nil
    @message = "You have logged out successfully."
  end
  
end

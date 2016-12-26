class UserMailer < ActionMailer::Base
    default :from => "thisisatest2394@gmail.com"
    
def registration_confirmation(user)
    @user = user
    mail(:to => @user.email, :subject => "Confirm Your Registration")
end    

end
class User < ActiveRecord::Base

=begin
    validate :bing_email
    def bing_email
        if not email.end_with? '@binghamton.edu'
            errors.add(:email, 'Must use Binghamton e-mail address')
        end
    end
=end

=begin
    validates_presence_of :first_name, :last_name, :email, :password
    validates_presence_of :password, :on => :create
    expect {validates_format_of :first_name, :with => /[A-Z][a-z]{1,29}/, :message => "should be capitalized and has to be at least one character"}.to raise_error(NameError)
    validates_format_of :last_name, :with => /[A-Z][a-zA-Z]{1,29}/, :message => "should only contain letters and start with a capital letter"
    validates_length_of :password, :minimum => 6, :allow_blank => false
    validates :password, presence: true 
    #validates :password_confirmation, presence: true, :if => :password_changed?
    #validates_confirmation_of :password
    #validates_presence_of :password_confirmation, :if => :password_changed?
    validates_uniqueness_of :email
    validates :email, :email_format => true
=end
end
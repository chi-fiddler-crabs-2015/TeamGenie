class UserMailer < ApplicationMailer
  default from: 'notifications@example.com'

  def welcome_email(user)
    @user = User.first
    @url  = 'http://teamgenie.herokuapp.com/login'
    mail(to: @user.email, subject: 'Welcome to TeamGenie')
  end
end

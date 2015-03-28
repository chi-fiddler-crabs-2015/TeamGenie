class UserMailer < ApplicationMailer
  default from: 'kay.lindenberg@gmail.com'

  def welcome_email(user)
    @user = user
    @url  = 'http://teamgenie.herokuapp.com/login'
    mail(to: @user.email, subject: 'Welcome to TeamGenie')
  end
end

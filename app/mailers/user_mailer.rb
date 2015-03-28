class UserMailer < ApplicationMailer
  default from: 'TeamGenieSports@gmail.com'

  def welcome_email(user)
    @url  = 'http://teamgenie.herokuapp.com/login'
    mail(to: user.email, subject: 'Welcome to TeamGenie')
  end
end

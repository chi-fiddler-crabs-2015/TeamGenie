class EmailAllMailer < ApplicationMailer
  default from: 'TeamGenieSports@gmail.com'

  def email_all(message, player, team)
    @message = message
    @player = player
    @team = team

    mail(to: @player.email, subject: "#{@team.captain.first_name} has sent you a message from TeamGenie")
  end

end

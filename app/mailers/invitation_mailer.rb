class InvitationMailer < ApplicationMailer
  default from: 'TeamGenieSports@gmail.com'

  def team_invitation(invited_user, team)
    @captain = team.captain
    @invited_user = invited_user
    @team = team

    @url  = 'http://teamgenie.herokuapp.com/login'
    mail(to: @invited_user.email, subject: "#{@invited_user.first_name}, you have been invited to join #{@team.name}")
  end

end

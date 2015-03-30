class InvitationMailer < ApplicationMailer
  default from: 'TeamGenieSports@gmail.com'

  def team_invitation(invited_user, team)
    @captain = team.captain
    @invited_user = invited_user
    @team = team

    @url  = 'http://teamgenie.herokuapp.com/login'
    mail(to: @invited_user.email, subject: "#{@invited_user.first_name}, you have been invited to join #{@team.name}")
  end

  def sign_up_invitation(invited_user, team)
    @team = team
    @captain = @team.captain
    @invited_user = invited_user

    @url  = "http://teamgenie.herokuapp.com/users/#{@invited_user.id}/edit"
    mail(to: @invited_user.email, subject: "#{@captain.first_name} invited you to join TeamGenie: #{@team.name}")
  end

end

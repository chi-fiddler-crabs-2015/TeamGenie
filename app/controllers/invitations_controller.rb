class InvitationsController < ApplicationController

  def create
    @invited_user = User.find_by(email: params[:invitation][:email])
    if @invited_user
      @team = find_team(params[:team_id])
      # 'Mailers are not working invitations'
      InvitationMailer.delay.team_invitation(@invited_user, @team)
      assign_user_to_team(@team, @invited_user)
      redirect_to team_path(@team)
    else
      puts 'Go to mailer logic - new member'
      redirect_to root_path
    end
  end

end

class InvitationsController < ApplicationController

  def create
    @invited_user = User.find_by(email: params[:invitation][:email])
    @team = find_team(params[:team_id])
    if @invited_user
      InvitationMailer.delay.team_invitation(@invited_user, @team)
      assign_user_to_team(@team, @invited_user)
    else
      email = params[:invitation][:email]
      InvitationMailer.delay.sign_up_invitation(email, @team)
    end
    render :nothing => true
  end

end

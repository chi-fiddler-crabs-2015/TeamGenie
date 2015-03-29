class InvitationsController < ApplicationController

  def create
    invited_user = User.find_by(email: params[:invitation][:email])
    if invited_user
      team = find_team(params[:team_id])
      # 'Go to mailer logic - existing member'
      assign_user_to_team(team, invited_user)
      redirect_to team_path(team)
    else
      puts 'Go to mailer logic - new member'
    end
  end

end

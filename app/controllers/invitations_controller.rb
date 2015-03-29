class InvitationsController < ApplicationController

  def create
    invited_user = User.find_by(email: params[:invitation][:email])
    if invited_user
      team = find_team(params[:team_id])
      puts 'Go to mailer logic - existing member'
      membership = team.memberships.create(player: invited_user)
      team.future_games.each do |game|
        membership.rsvps.create(game: game)
      end
      redirect_to team_path(team)
    else
      puts 'Go to mailer logic - new member'
    end
  end

end

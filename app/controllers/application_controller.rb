class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def no_page_found
    redirect_to :back
  end

  def current_user
    @current_user ||= session[:user_id] && User.find_by(id: session[:user_id])
  end

  def current_user_redirect
    redirect_to "/login" unless current_user
  end

  def current_team_member(team)
    if team.memberships.find_by(player: current_user) == nil
      redirect_to "/teams"
    end
  end

  def team_captain(team)
    if team.captain != current_user
      redirect_to "/teams/#{team.id}"
    end
  end

  def find_team(team_id)
    Team.find_by(id: team_id)
  end

  def find_location(location_id)
    Location.find_by(id: location_id)
  end

  def find_location_by_name(location_name)
    Location.find_by(name: location_name)
  end

  def create_rsvps(game)
    game.team.memberships.each do |membership|
      membership.rsvps.create(game: game)
    end
  end

  def current_game(game_id)
    Game.find_by(id: game_id)
  end

  def assign_user_to_team(team, invited_user)
    membership = team.memberships.create(player: invited_user)
    team.future_games.each do |game|
      membership.rsvps.create(game: game)
    end
  end

end

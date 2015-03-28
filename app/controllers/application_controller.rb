class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def current_user
    @current_user ||= session[:user_id] && User.find_by(id: session[:user_id])
  end

  def find_team(team_id)
    Team.find_by(id: team_id)
  end

  def find_location(location_id)
    Location.find_by(id: location_id)
  end

  def create_game_time(datetime)
    DateTime.new(datetime['game_time(1i)'].to_i, datetime['game_time(2i)'].to_i, datetime['game_time(3i)'].to_i, datetime['game_time(4i)'].to_i, datetime['game_time(5i)'].to_i, 0)
  end

  def create_rsvps(game)
    game.team.memberships.each do |membership|
      membership.rsvps.create(game: game)
    end
  end

end

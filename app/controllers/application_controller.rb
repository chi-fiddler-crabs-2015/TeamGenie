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

end

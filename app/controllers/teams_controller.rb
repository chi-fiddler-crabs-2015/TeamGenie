class TeamsController < ApplicationController

  def index
    @teams = current_user.teams
  end

  def new
  end

  def create
    new_team = current_user.teams.create(team_params)
    if new_team.save
      redirect_to teams_path
    else
      flash[:error] = "Make sure to fill out all fields!"
      render 'new' and return
    end
  end

  def show
    # Write helper method
    @team = Team.find_by(id: params[:id])
    @future_games = @team.future_games
    @recent_games = @team.recent_games
  end

  # def update
  #   team = Team.find_by(id: params[:id])
  # end

  private

  def team_params
    params.require(:team).permit(:name, :activity, :home_location, :team_logo)
  end

end

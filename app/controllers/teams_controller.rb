class TeamsController < ApplicationController

  def index
    @teams = current_user.teams
  end

  def new
    @team = Team.new
  end

  def create
    new_team = current_user.teams.create(team_params)
    current_user.memberships.create(team: new_team)
    if new_team.save
      redirect_to teams_path
    else
      flash[:error] = "Make sure to fill out all fields!"
      render 'new' and return
    end
  end

  def show
    @team = find_team(params[:id])
    @future_games = @team.future_games
    @recent_games = @team.recent_games
  end

  # def update
  #   team = find_team(params[:id])
  # end

  private

  def team_params
    params.require(:team).permit(:name, :activity, :home_location, :team_logo)
  end

end

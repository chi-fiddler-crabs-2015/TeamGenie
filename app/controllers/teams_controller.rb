class TeamsController < ApplicationController

  def index
    @teams = current_user.my_teams
  end

  def new
    @team = Team.new
  end

  def create
    new_team = current_user.teams.create(team_params)
    current_user.memberships.create(team: new_team)
    default_image = File.new('public/system/teams/team_logos/default_team_logo/original/default_team_logo.jpg')
    new_team.update_attributes(team_logo: default_image) if new_team.team_logo.url == '/team_logos/original/missing.png'
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

  def edit
    @team = find_team(params[:id])
  end

  def update
    team = find_team(params[:id])
    team.update(team_params)
    redirect_to team_path(team)
  end

  def roster
    @team = find_team(params[:team_id])
    @memberships = @team.memberships
  end

  private

  def team_params
    params.require(:team).permit(:name, :activity, :home_location, :team_logo)
  end

end

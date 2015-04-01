class TeamsController < ApplicationController

  before_filter :current_user_redirect

  def index
    @teams = current_user.my_teams
  end

  def new
    @team = Team.new
  end

  def create
    new_team = current_user.teams.create(team_params)
    current_user.memberships.create(team: new_team)
    location_name = find_location_by_name(params[:team][:home_location])
    default_image = File.new('public/system/teams/team_logos/default_team_logo/original/default_team_logo.jpg')
    new_team.update_attributes(team_logo: default_image) if new_team.team_logo.url == '/team_logos/original/missing.png'
    new_team.update_attributes(home_location: location_name)
    if new_team.save
      redirect_to teams_path
    else
      flash[:error] = "Make sure to fill out all fields!"
      render 'new' and return
    end
  end

  def show
    @team = find_team(params[:id])
    current_team_member(@team)
    @future_games = @team.future_games
    @recent_games = @team.recent_games
  end

  def edit
    @team = find_team(params[:id])
    team_captain(@team)
  end

  def update
    team = find_team(params[:id])
    team_captain(team)
    team.update(team_params)
    redirect_to team_path(team)
  end

  def roster
    @team = find_team(params[:team_id])
    team_captain(@team)
    @memberships = @team.memberships
  end

  def distribute_dues
    @team = find_team(params[:team_id])
    team_captain(@team)
    @team.outstanding_memberships.each do |membership|
      membership.amount_owed = (@team.dues - @team.paid_dues) / @team.outstanding_memberships_count
      membership.save
    end
    redirect_to team_roster_path(@team)
  end

  private

  def team_params
    params.require(:team).permit(:name, :activity, :team_logo)
  end

end

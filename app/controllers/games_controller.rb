class GamesController < ApplicationController
  def index
    team = find_team(params[:team_id])
    @games = team.games
  end

  def new
    if current_user
      @game = Game.new
    else
      flash[:notice] = "You must be logged in to create a game"
      redirect_to login_path
    end
  end

  def create
    team = find_team(params[:team_id])
    game_time = create_game_time(params[:game])
    # location = Location.find_by_id(params[:game][:location])
    game = team.games.new(game_time: game_time, location: Location.last)
    # update_location(game)
    if game.save
      create_rsvps(game)
      redirect_to team_path(team)
    else
      flash[:notice] = "Game was not valid."
      redirect_to new_team_game_path(team)
    end
  end

  def destroy
    team = find_team(params[:team_id])
    if current_user
      @game = current_game(params[:id])
      @game.destroy
    end
    redirect_to team_games_path(team)
  end

  def edit
    redirect_to edit_team_game_path(params[:team_id],params[:id])
  end

  def show
    redirect_to team_game_path(params[:id])
  end

  def update
    @game = current_game(params[:id])
    @game.update_attributes(params[:game])
  end

  private

  def game_params
    params.require(:game).permit(:team, :game_time)
  end

end




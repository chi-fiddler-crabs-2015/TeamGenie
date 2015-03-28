class GamesController < ApplicationController
  def index
    @games = current_user.games
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
    team = Team.find_by(id: params[:team_id])
    datetime = params[:game]
    game_time = DateTime.new(datetime['game_time(1i)'].to_i, datetime['game_time(2i)'].to_i, datetime['game_time(3i)'].to_i, datetime['game_time(4i)'].to_i, datetime['game_time(5i)'].to_i, datetime['game_time(6i)'].to_i)
    # location = Location.find_by_id(params[:location])
    game = team.games.new(game_time: game_time, location: Location.find(1))
    puts game.game_time
    # update_location(game)
    if game.save
      redirect_to team_path(team)
    else
      flash[:notice] = "Game was not valid."
      redirect_to new_team_game_path(team)
    end
  end

  def destroy
    if current_user
      @game = current_game(params[:id])
      @game.destroy
    end
    redirect_to team_games_path
  end

  def edit
    redirect_to edit_team_game_path(params[:id])
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




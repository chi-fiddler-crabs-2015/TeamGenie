class GameController < ApplicationController
  def index
    @games = current_user.games
  end

  def new
    if current_user
      @game = Game.new
    else
      flash[:notice] = "You must be logged in to create a game"
      redirect_to login
    end
  end

  def create
    @location = Location.find_by_id(params[:location])
    @game = current_user.games.new(game_params)
    @game.update_location
    if @game.save
      redirect_to games_path
    else
      flash[:notice] = "Game was not valid."
    end
  end

end


private

def game_params
  params.require(:game).permit(:team, :game_time)
end


class GameController < ApplicationController
  def index
    @games = Game.all
  end

  def new
    if current_user
      @game = Game.new
    else
      flash[:notice] = "You must be logged in to create a game"
      redirect_to login_page
    end
  end

end


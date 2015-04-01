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
    @user = current_user
    @team = find_team(params[:team_id])
    @game_time = create_game_time(params[:game])
    location = find_location_by_name(params[:game][:location])
    @game = @team.games.new(game_time: @game_time, location: location)
    if @game.save
      create_rsvps(@game)
      GameMailer.delay.initial_invitation(@user, @team, @game)
      GameMailer.delay_until(@game_time - 6.days).six_day_invitation(@user, @team, @game)
      GameMailer.delay_until(@game_time - 2.days).two_day_invitation(@team, @game)
      redirect_to team_path(@team)
    else
      flash[:notice] = "Game was not valid."
      redirect_to new_team_game_path(@team)
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
  end

  def show
    redirect_to team_game_path(params[:id])
  end

  def update
    @game = current_game(params[:id])
    @game.update_attributes(params[:game])
  end

  private

  def create_game_time(datetime)
    DateTime.new(datetime['game_time(1i)'].to_i, datetime['game_time(2i)'].to_i, datetime['game_time(3i)'].to_i, datetime['game_time(4i)'].to_i, datetime['game_time(5i)'].to_i, 0)
  end

  def game_params
    params.require(:game).permit(:team, :game_time)
  end

end




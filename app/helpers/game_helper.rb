module GameHelper
  def update_location(game)
    game.update_attributes(location: @location)
  end

  def current_game(game_id)
    Game.find_by(id: game_id)
  end
end


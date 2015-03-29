module GameHelper
  def update_location(game)
    game.update_attributes(location: @location)
  end

end


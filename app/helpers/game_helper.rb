module GameHelper
  def update_location
    @game.update_attributes(location: @location)
  end
end


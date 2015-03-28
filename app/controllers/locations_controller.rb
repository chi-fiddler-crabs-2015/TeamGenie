class LocationsController < ApplicationController

  def show
    @location = find_location(params[:id])
  end

end

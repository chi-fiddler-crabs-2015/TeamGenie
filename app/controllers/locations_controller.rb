class LocationsController < ApplicationController

  def show
    @location = Location.find_by(id: params[:id])
  end

end

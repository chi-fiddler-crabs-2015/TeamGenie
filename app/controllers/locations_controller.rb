class LocationsController < ApplicationController

  def show
    @location = find_location(params[:id])
  end

  def create
    new_location = Location.create(location_params)
    if new_location.valid?
      redirect_to teams_path
    else
      render 'new' and return
    end
  end

  private

  def location_params
    params.require(:location).permit(:name, :address, :city, :state, :description)
  end

end

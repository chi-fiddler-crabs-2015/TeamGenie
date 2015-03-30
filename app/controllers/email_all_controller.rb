class EmailAllController < ApplicationController

  def create
    @team = find_team(params[:team_id])

    redirect_to team_path(@team)
  end

end

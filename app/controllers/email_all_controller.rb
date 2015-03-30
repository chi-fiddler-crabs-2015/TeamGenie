class EmailAllController < ApplicationController

  def create
    @team = find_team(params[:team_id])
    @message = params[:email_all][:message]
    @team.players.each do |player|
      EmailAllMailer.delay.email_all(@message, player)
    end
    redirect_to team_path(@team)
  end

end

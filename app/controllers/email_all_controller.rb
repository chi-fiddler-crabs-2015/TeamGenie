class EmailAllController < ApplicationController

  def create
    @team = find_team(params[:team_id])
    @message = params[:email_all][:message]
    @team.players.each do |player|
      EmailAllMailer.delay.email_all(@message, player, @team)
    end
    render nothing: true
    # redirect_to :back
  end

end

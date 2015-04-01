class EmailAllController < ApplicationController

  before_action :current_user

  def create
    @team = find_team(params[:team_id])
    team_captain(@team)
    @message = params[:email_all][:message]
    @team.players.each do |player|
      EmailAllMailer.delay.email_all(@message, player, @team)
    end
    redirect_to :back
  end

end

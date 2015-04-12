class EmailAllController < ApplicationController

  before_action :current_user

  def create
    @team = find_team(params[:team_id])
    @message = params[:email_all][:message]
    @team.players.each do |player|
      EmailAllMailer.delay.email_all(@message, player, @team)
    end
    render :nothing => true
  end

end

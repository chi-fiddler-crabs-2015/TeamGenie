class RsvpsController < ApplicationController

  skip_before_action :verify_authenticity_token

  before_action :current_user

  def update
    rsvp = Rsvp.find_by(id: params[:id])
    rsvp.attending = params[:attendance]
    rsvp.save
    respond_to do |format|
      format.js do
        render partial: 'games/show', locals: {player: current_user, game: current_game(params[:game_id])} and return
      end
    end
  end

end

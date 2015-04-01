class RsvpsController < ApplicationController

  skip_before_action :verify_authenticity_token

  def update
    rsvp = Rsvp.find_by(id: params[:id])
    puts "******************************"
    puts rsvp.attending
    rsvp.attending = params[:attendance]
    puts "******************************"
    puts rsvp.attending
    rsvp.save
    respond_to do |format|
      format.js do
        render partial: 'games/show', locals: {player: current_user, game: current_game(params[:game_id])} and return
      end
    end
  end

end

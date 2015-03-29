class RsvpsController < ApplicationController

  skip_before_action :verify_authenticity_token

  def update
    rsvp = Rsvp.find_by(id: params[:id])
    rsvp.attending = params[:attendance]
    rsvp.save
  end

end

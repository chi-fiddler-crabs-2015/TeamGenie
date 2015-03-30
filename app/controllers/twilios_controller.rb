class TwiliosController < ApplicationController
  skip_before_filter  :verify_authenticity_token
  TEAM_GENIE_PHONE = "+18472304227"

  def create
    client.messages.create({
        from: TEAM_GENIE_PHONE,
        to: params[:phone],
        body: body(params[:name])
      })
    render :nothing => true
  end

  def client
    @_client ||= Twilio::REST::Client.new
  end

  def body(name)
    <<-MSG
    Hey #{name}, we are just texting you to remind you there is a game tomorrow!  Don't forget!!!!!!!!!!
    MSG
  end
end

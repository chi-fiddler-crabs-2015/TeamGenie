class TwiliosController < ApplicationController
  skip_before_filter  :verify_authenticity_token
  TEAM_GENIE_PHONE = "+18472304227"

  def create
    body = { "to" => params[:to], "from" => params[:from], "body" => params[:body]}
    puts body
    client.messages.create({
        from: TEAM_GENIE_PHONE,
        to: params[:phone],
        body: body(body)
      })
    render :nothing => true
  end

  def client
    @_client ||= Twilio::REST::Client.new
  end

  def body(body)
    puts to = body["to"]
    puts from = body["from"]
    puts body = body["body"]
    <<-MSG
    Hey #{to}, #{body}
    --#{from}
    MSG
  end
end

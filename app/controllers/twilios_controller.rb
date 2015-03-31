class TwiliosController < ApplicationController
  skip_before_filter  :verify_authenticity_token
  TEAM_GENIE_PHONE = "+18472304227"

  def create
    body = { "to" => params[:to], "from" => params[:from], "body" => params[:body]}
    client.messages.create({
        from: TEAM_GENIE_PHONE,
        to: params[:phone],
        body: body(body)
      })
    render :nothing => true
  end

  def team_text
    team = find_team(params[:team].to_i)
    team.players.each do |player|
      make_message(player, params[:message])
    end
    render :nothing => true
  end

  def client
    @_client ||= Twilio::REST::Client.new
  end

  def make_message(player, body)
    body = { "to" => player.first_name, "from" => current_user.first_name, "body" => body}
    client.messages.create({
        from: TEAM_GENIE_PHONE,
        to: player.phone_number,
        body: body(body)
    })
  end

  def body(body)
    to = body["to"]
    from = body["from"]
    body = body["body"]
    <<-MSG
    Hey #{to}, #{body}
    --#{from}
    MSG
  end
end

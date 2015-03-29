class ApplicationMailer < ActionMailer::Base
  default from: "from@example.com"
  layout 'mailer'

  def current_user
    @current_user ||= session[:user_id] && User.find_by(id: session[:user_id])
  end

  def team_email(team)
    team.players.pluck(:email)
  end
end

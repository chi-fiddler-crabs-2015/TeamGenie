class ApplicationMailer < ActionMailer::Base
  default from: "from@example.com"
  layout 'mailer'

  def team_email(team)
    team.players.pluck(:email)
  end
end

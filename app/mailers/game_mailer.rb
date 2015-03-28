class GameMailer < ApplicationMailer
    default from: 'TeamGenieSports@gmail.com'

  def initial_invitation(@user, @team, @game)
    @url  = 'http://teamgenie.herokuapp.com/login'
    team_email(@team).each do |member_email|
      mail(to: member_email, subject: '#{@team.name} Game Invitation: #{@game.game_time}')
    end
  end
end

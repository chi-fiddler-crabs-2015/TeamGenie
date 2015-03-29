class GameMailer < ApplicationMailer
    default from: 'TeamGenieSports@gmail.com'

  def initial_invitation(team, game)
    @captain = current_user
    @team = team
    @game = game

    @url  = 'http://teamgenie.herokuapp.com/login'
    team_email(@team).each do |member_email|
      mail(to: member_email, subject: '#{@team.name} Game Invitation: #{@game.game_time}')
    end
  end

  def six_day_invitation(user, team, game)
    @team = team
    @game = game

    @url  = 'http://teamgenie.herokuapp.com/login'
    team_email(@team).each do |member_email|
      mail(to: member_email, subject: '#{@team.name} Game Invitation: #{@game.game_time}')
    end
  end

  def two_day_invitation(user, team, game)
    @team = team
    @game = game

    @url  = 'http://teamgenie.herokuapp.com/login'
    team_email(@team).each do |member_email|
      mail(to: member_email, subject: '#{@team.name} Game Invitation: #{@game.game_time}')
    end
  end
end

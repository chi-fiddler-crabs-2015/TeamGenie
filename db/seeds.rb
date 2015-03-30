require 'faker'
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

captain = User.create!(first_name: 'Carlos', password: 'hellohello', last_name: 'Dunga', email: 'dunga@dunga.com', username: 'dunga', phone_number: '18479977890', birthday: Faker::Date.between(40.years.ago, 30.years.ago))

Location.create!(name: 'Lincoln Park South Fields', address: '1627 N Stockton Dr', city: 'Chicago', state: 'IL', zip_code: '60614', directions: "Off of LaSalle and Clark, just south of the Lincoln Park Zoo")
Location.create!(name: 'River Park Field', address: '5100 N Francisco', city: 'Chicago', state: 'IL', zip_code: '60625', directions: "Off of Foster and Francisco, just south of the high school")
Location.create!(name: 'Toyota Park', address: '7000 Harlem Ave', city: 'Bridgeview', state: 'IL', zip_code: '60455', directions: "Off of Harlem Ave by Argo Community High School")

# Test the photo on the seeds.
team1 = captain.teams.create!(name: 'Good Times FC', activity: 'Soccer', home_location: Location.all.sample, team_logo: File.new('public/system/teams/team_logos/default_team_logo/original/default_team_logo.jpg'))
captain.memberships.create(team: team1)
User.create!(first_name: 'test1', last_name: 'test1', username: 'test1', email: 't1@t.com', password: 'hellohello')
User.create!(first_name: 'test2', last_name: 'test2', username: 'test2', email: 't2@t.com', password: 'hellohello')
User.create!(first_name: 'test3', last_name: 'test3', username: 'test3', email: 't3@t.com', password: 'hellohello')


15.times do
  team1.players.create!(first_name: Faker::Name.first_name, password: 'hellohello', last_name: Faker::Name.last_name, email: Faker::Internet.safe_email, username: Faker::Internet.user_name, birthday: Faker::Date.between(60.years.ago, 18.years.ago), phone_number: Faker::PhoneNumber.cell_phone)
end

10.times do |index|
  game = team1.games.create!(location: Location.all.sample, game_time: Time.now()+(index.weeks))
  team1.players.each do |player|
    player.memberships.first.rsvps.create!(game: game, attending: ['pending', 'not attending', 'attending'].sample)
  end
end

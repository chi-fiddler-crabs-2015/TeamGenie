require 'faker'
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

team_names = ['Portland Timbers','Los Angeles Galaxy','Seattle Sounders','Houston Dynamo','Real Salt Lake','San Jose Earthquakes','Sporting KC']
captain = User.create!(first_name: 'Carlos', password: 'hellohello', last_name: 'Dunga', email: 'dunga@dunga.com', username: 'dunga', phone_number: Faker::PhoneNumber.cell_phone, birthday: Faker::Date.between(40.years.ago, 30.years.ago))

Location.create!(name: 'Lincoln Park South Fields', address: '1627 N Stockton Dr', city: 'Chicago', state: 'IL', zip_code: '60614', directions: "Off of LaSalle and Clark, just south of the Lincoln Park Zoo")
Location.create!(name: 'River Park Field', address: '5100 N Francisco', city: 'Chicago', state: 'IL', zip_code: '60625', directions: "Off of Foster and Francisco, just south of the high school")
Location.create!(name: 'Toyota Park', address: '7000 Harlem Ave', city: 'Bridgeview', state: 'IL', zip_code: '60455', directions: "Off of Harlem Ave by Argo Community High School")

team1 = captain.teams.create!(name: 'Good Times FC', activity: 'Soccer', home_location: Location.all.sample)

20.times do
  team1.players.create!(first_name: Faker::Name.first_name, password: 'hellohello', last_name: Faker::Name.last_name, email: Faker::Internet.safe_email, username: Faker::Internet.user_name, birthday: Faker::Date.between(60.years.ago, 18.years.ago), phone_number: Faker::PhoneNumber.cell_phone)
end

10.times do
  game = team1.games.create!(location: Location.all.sample, game_time: Time.now()+(rand(10).weeks))
  team1.players.each do |player|
    player.memberships.first.rsvps.create!(game: game)
  end
end

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

10.times do
  Location.create!(name: Faker::Address.street_name, address: Faker::Address.street_address, city: Faker::Address.city, state: Faker::Address.state_abbr, zip_code: Faker::Address.zip, directions: Faker::Lorem.paragraph)
end

captain.teams.create!(name: 'Good Times FC', activity: 'Soccer', home_location: Location.all.sample)

20.times do
  User.create!(first_name: Faker::Name.first_name, password: 'hellohello', last_name: Faker::Name.last_name, email: Faker::Internet.safe_email, username: Faker::Internet.user_name, birthday: Faker::Date.between(60.years.ago, 18.years.ago), phone_number: Faker::PhoneNumber.cell_phone)
end

19.times do |index|
  Membership.create!(player: User.all[index+1], team: Team.all.sample)
end

10.times do
  Game.create!(location: Location.all.sample, game_time: Time.now()-rand(100000), team: Team.all.sample)
end

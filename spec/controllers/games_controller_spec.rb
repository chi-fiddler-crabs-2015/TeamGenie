require 'rails_helper'

RSpec.describe GamesController, type: :controller do
  let!(:user) { create(:user) }

  before(:each) do
    allow_any_instance_of(GamesController).to receive(:current_user).and_return(user)
  end

  # TEST THIS WITH CAPYBARA
  # context "GET #index" do
  #   it 'assigns @games to all games' do
  #     location = Location.create!(name: "here", address: "351 west hubbard", city: "chicago", state: "il", zip_code: "60604", directions: "turn right and left")
  #     team = user.teams.create!(name: "DBC", activity: "soccer",  home_location: location)
  #     game = team.games.create!(game_time: DateTime.now, location: location)
  #     get :index, :team_id => team.id
  #     expect(assigns(:games)).to eq(Game.all)
  #   end
  # end
end

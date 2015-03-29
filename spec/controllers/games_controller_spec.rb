require 'rails_helper'

RSpec.describe GamesController, type: :controller do
  let!(:user) { create(:user) }

  before(:each) do
    allow_any_instance_of(GamesController).to receive(:current_user).and_return(user)
  end

  context "GET #index" do
    it 'assigns @games to all games' do
      location = Location.create!(name: "here", address: "351 west hubbard", city: "chicago", state: "il", zip_code: "60604", directions: "turn right and left")
      team = user.teams.create!(name: "DBC", activity: "soccer",  home_location: location)
      game = team.games.create!(game_time: DateTime.now, location: location)
      get :index, :team_id => team.id
      expect(assigns(:games)).to eq(Game.all)
    end
  end

  context "GET #new" do
    it 'instantiates a new game' do
      location = Location.create!(name: "here", address: "351 west hubbard", city: "chicago", state: "il", zip_code: "60604", directions: "turn right and left")
      team = user.teams.create!(name: "DBC", activity: "soccer",  home_location: location)
      game = team.games.create!(game_time: DateTime.now, location: location)
      get :new, :team_id => team.id
      expect(assigns(:game)).to be_a Game
    end
  end

  context "POST #create" do
    # TEST WITH CAPYBARA
    # describe "when valid parameters are passed" do
    #   it "creates a new game" do
    #     location = Location.create!(name: "here", address: "351 west hubbard", city: "chicago", state: "il", zip_code: "60604", directions: "turn right and left")
    #     team = user.teams.create!(name: "DBC", activity: "soccer",  home_location: location)
    #     game = team.games.new(game_time: DateTime.now, location: location)
    #     expect {
    #       post :game, { game: game }}.to change{Game.count}.by(1)
    #   end
    # end
  end

  context "POST #destroy" do
    describe "when valid parameters are passed" do
      it "should delete a game" do
        location = Location.create!(name: "here", address: "351 west hubbard", city: "chicago", state: "il", zip_code: "60604", directions: "turn right and left")
        team = user.teams.create!(name: "DBC", activity: "soccer",  home_location: location)
        game = team.games.create!(game_time: DateTime.now, location: location)
        expect {
          delete :destroy, id: game.to_param, team_id: team.to_param }.to change{Game.count}.by(-1)
      end
    end
  end

  context "GET #edit" do
    #TEST ON CAPYBARA
    # describe "when valid parameters are passed" do
    #   it "should redirect to the edit team game path" do
    #     location = Location.create!(name: "here", address: "351 west hubbard", city: "chicago", state: "il", zip_code: "60604", directions: "turn right and left")
    #     team = user.teams.create!(name: "DBC", activity: "soccer",  home_location: location)
    #     game = team.games.create!(game_time: DateTime.now, location: location)
    #     expect(get :edit, { id: game.id, team_id: team.id}).to redirect_to edit_team_game_path(id: game.id, team_id: team.id)

    #   end
    # end
  end

  context "GET #show" do
    #TEST ON CAPYBARA
    # describe "when valid parameters are passed" do
    #   it "should redirect to the edit team game path" do
    #     location = Location.create!(name: "here", address: "351 west hubbard", city: "chicago", state: "il", zip_code: "60604", directions: "turn right and left")
    #     team = user.teams.create!(name: "DBC", activity: "soccer",  home_location: location)
    #     game = team.games.create!(game_time: DateTime.now, location: location)
    #     get :show, id: game.to_param, team_id: team.to_param
    #     expect(response).to redirect_to(team_game_path(team.id, game.id))
    #   end
    # end
  end
end

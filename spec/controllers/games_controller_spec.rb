require 'rails_helper'

RSpec.describe GamesController, type: :controller do
  let!(:user) { create(:user) }
  let!(:location) { create(:location) }

  before(:each) do
    allow_any_instance_of(GamesController).to receive(:current_user).and_return(user)
  end

  context "GET #index" do
    it 'assigns @games to all games' do
      team = user.teams.create!(name: "DBC", activity: "soccer",  home_location: location)
      game = team.games.create!(game_time: DateTime.now, location: location)
      get :index, :team_id => team.id
      expect(assigns(:games)).to eq(Game.all)
    end
  end

  context "GET #new" do
    describe "when passed valid parameters" do
      it 'instantiates a new game' do
        team = user.teams.create!(name: "DBC", activity: "soccer",  home_location: location)
        game = team.games.create!(game_time: DateTime.now, location: location)
        get :new, :team_id => team.id
        expect(assigns(:game)).to be_a Game
      end
    end
  end

  context "POST #create" do
    describe "when valid parameters are passed" do
      xit "creates a new game" do
        team = user.teams.create!(name: "DBC", activity: "soccer",  home_location: location)
        game = team.games.new(game_time: DateTime.now, location: location)
        expect {
          post :game, { team: team.id, game: {'game_time(1i)' => "1", 'game_time(2i)' => "1", 'game_time(3i)' => "1", 'game_time(4i)' => "1", 'game_time(5i)' => "1", 0 => "1" } }}.to change{Game.count}.by(1)
      end
    end
  end

  context "POST #destroy" do
    describe "when valid parameters are passed" do
      it "should delete a game" do
        team = user.teams.create!(name: "DBC", activity: "soccer",  home_location: location)
        game = team.games.create!(game_time: DateTime.now, location: location)
        expect {
          delete :destroy, id: game.to_param, team_id: team.to_param }.to change{Game.count}.by(-1)
      end
    end
  end

  context "GET #edit" do
    describe "when valid parameters are passed" do
      xit "should redirect to the edit team game path" do
        team = user.teams.create!(name: "DBC", activity: "soccer",  home_location: location)
        game = team.games.create!(game_time: DateTime.now, location: location)
        view = get :edit, { :id => game, :team_id => team }
        expect(view).to redirect_to edit_team_game_path(team_id, game)
      end
    end
  end

  context "GET #show" do
    describe "when valid parameters are passed" do
      xit "should redirect to the edit team game path" do
        team = user.teams.create!(name: "DBC", activity: "soccer",  home_location: location)
        game = team.games.create!(game_time: DateTime.now, location: location)
        get :show, id: game.to_param, team_id: team.to_param
        expect(response).to redirect_to(team_game_path(team.id, game.id))
      end
    end
  end
end

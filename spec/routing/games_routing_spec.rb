require "rails_helper"

RSpec.describe GamesController, :type => :routing do
  describe "routing" do
    it "routes to #index" do
      expect(:get => "/teams/1/games").to route_to("games#index", :team_id => "1")
    end

    it "routes to #new" do
      expect(:get => "/teams/1/games/new").to route_to("games#new", :team_id => "1")
    end

    it "routes to #create" do
      expect(:post => "/teams/1/games").to route_to("games#create", :team_id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/teams/1/games/1/edit").to route_to("games#edit", :team_id => "1", :id => "1")
    end
  end
end

require "rails_helper"

RSpec.describe GamesController, :type => :routing do
  describe "routing" do
    it "routes to #index" do
      expect(:get => "/teams/1/games").to route_to("games#index", :team_id => "1")
    end
  end
end

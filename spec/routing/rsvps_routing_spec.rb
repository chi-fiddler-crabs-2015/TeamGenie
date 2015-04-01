require "rails_helper"

RSpec.describe RsvpsController, :type => :routing do
  describe "routing" do
    it "routes to #update" do
      expect(:put => "/teams/1/games/1/rsvps/1").to route_to("rsvps#update", :team_id => "1", :game_id => "1", :id => "1")
    end
  end
end

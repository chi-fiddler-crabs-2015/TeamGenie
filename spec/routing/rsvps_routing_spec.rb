require "rails_helper"

RSpec.describe RsvpsController, :type => :routing do
  describe "routing" do
    it "routes to #destroy" do
      expect(:delete => "/teams/1/memberships/1").to route_to("memberships#destroy", :team_id => "1", :id => "1")
    end
  end
end

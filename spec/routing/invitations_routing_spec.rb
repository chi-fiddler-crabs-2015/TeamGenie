require "rails_helper"

RSpec.describe InvitationsController, :type => :routing do
  describe "routing" do
    it "routes to #index" do
      expect(:post => "/teams/1/invitations").to route_to("invitations#create", :team_id => "1")
    end
  end
end

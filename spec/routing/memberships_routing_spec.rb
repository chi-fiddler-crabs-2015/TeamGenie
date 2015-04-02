require "rails_helper"

RSpec.describe MembershipsController, :type => :routing do
  describe "routing" do
    it "routes to #mark_paid" do
      expect(:put => "/teams/1/memberships/1/mark_paid").to route_to("memberships#mark_paid", :team_id => "1", :membership_id => "1")
    end

    it "routes to #mark_unpaid" do
      expect(:put => "/teams/1/memberships/1/mark_unpaid").to route_to("memberships#mark_unpaid", :team_id => "1", :membership_id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/teams/1/memberships/1").to route_to("memberships#destroy", :team_id => "1", :id => "1")
    end

    it "routes to #update" do
      expect(:put => "/teams/1/memberships/1").to route_to("memberships#update", :team_id => "1", :id => "1")
    end
  end
end

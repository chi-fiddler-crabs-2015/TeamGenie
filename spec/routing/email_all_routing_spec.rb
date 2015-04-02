require "rails_helper"

RSpec.describe EmailAllController, :type => :routing do
  describe "routing" do
    it "routes to #index" do
      expect(:post => "/teams/1/email_all").to route_to("email_all#create", :team_id => "1")
    end
  end
end

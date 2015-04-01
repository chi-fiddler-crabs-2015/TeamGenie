require "rails_helper"

RSpec.describe StripeController, :type => :routing do
  describe "routing" do
    it "routes to #oauth" do
      expect(:get => "/connect/oauth").to route_to("stripe#oauth")
    end

    it "routes to #confirm" do
      expect(:get => "/connect/confirm").to route_to("stripe#confirm")
    end

    it "routes to #deauthorize" do
      expect(:get => "/connect/deauthorize").to route_to("stripe#deauthorize")
    end

    it "routes to #managed" do
      expect(:post => "/connect/managed").to route_to("stripe#managed")
    end

    it "routes to #standalone" do
      expect(:post => "/connect/standalone").to route_to("stripe#standalone")
    end
  end
end

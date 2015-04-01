require "rails_helper"

RSpec.describe StripeController, :type => :routing do
  describe "routing" do
    it "routes to #stripe" do
      expect(:post => "/hooks/stripe").to route_to("hooks#stripe")
    end
  end
end

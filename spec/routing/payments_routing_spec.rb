require "rails_helper"

RSpec.describe PaymentsController, :type => :routing do
  describe "routing" do
    it "routes to #index" do
      expect(:get => "/users/1/payments").to route_to("payments#index", :user_id: "1")
    end

    it "routes to #index" do
      expect(:get => "/users/1/payments").to route_to("payments#show", :user_id: "1")
    end

    it "routes to #index" do
      expect(:get => "/users/1/payments").to route_to("payments#index", :user_id: "1")
    end

    it "routes to #index" do
      expect(:get => "/users/1/payments").to route_to("payments#index", :user_id: "1")
    end
  end
end

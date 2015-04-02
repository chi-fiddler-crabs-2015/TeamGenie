require "rails_helper"

RSpec.describe PaymentsController, :type => :routing do
  describe "routing" do
    it "routes to #index" do
      expect(:get => "/teams/1/payments").to route_to("payments#index", :team_id => "1")
    end

    it "routes to #pay" do
      expect(:post => "/teams/1/payments/1/pay").to route_to("payments#pay", :team_id => "1", :id => "1")
    end

    it "routes to #show" do
      expect(:get => "/teams/1/payments/1").to route_to("payments#show", :team_id => "1", :id => "1")
    end

    it "routes to #update" do
      expect(:put => "/teams/1/payments/1").to route_to("payments#update", :team_id => "1", :id => "1")
    end
  end
end

require "rails_helper"

RSpec.describe PaymentsController, :type => :routing do
  describe "routing" do
    it "routes to #index" do
      expect(:get => "/users/1/payments").to route_to("payments#index", :user_id => "1")
    end

    it "routes to #pay" do
      expect(:post => "/users/1/payments/1/pay").to route_to("payments#pay", :user_id => "1", :id => "1")
    end

    it "routes to #show" do
      expect(:get => "/users/1/payments/1").to route_to("payments#show", :user_id => "1", :id => "1")
    end

    it "routes to #update" do
      expect(:put => "/users/1/payments/1").to route_to("payments#update", :user_id => "1", :id => "1")
    end
  end
end

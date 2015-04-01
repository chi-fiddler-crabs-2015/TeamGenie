require "rails_helper"

RSpec.describe TwiliosController, :type => :routing do
  describe "routing" do
    it "routes to #new" do
      expect(:get => "/login").to route_to("sessions#new")
    end

    it "routes to #create" do
      expect(:post => "/send_sms").to route_to("twilios#create")
    end
  end
end

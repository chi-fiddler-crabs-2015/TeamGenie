require "rails_helper"

RSpec.describe LocationsController, :type => :routing do
  describe "routing" do
    it "routes to #create" do
      expect(:post => "/locations").to route_to("locations#create")
    end
  end
end

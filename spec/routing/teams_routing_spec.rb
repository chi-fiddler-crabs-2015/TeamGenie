require "rails_helper"

RSpec.describe TeamsController, :type => :routing do
  describe "routing" do
    it "routes to #index" do
      expect(:get => "/teams/1").to route_to("teams#index", :team_id => "1")
    end

    it "routes to #new" do
      expect(:get => "/teams/new").to route_to("teams#new", :team_id => "1")
    end

    it "routes to #create" do
      expect(:post => "/teams/1").to route_to("teams#create", :team_id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/teams/1/edit").to route_to("teams#edit", :team_id => "1", :id => "1")
    end

    it "routes to #show" do
      expect(:get => "/teams/1").to route_to("teams#show", :team_id => "1", :id => "1")
    end

    it "routes to #update" do
      expect(:put => "/teams/1").to route_to("teams#update", :team_id => "1", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/teams/1").to route_to("teams#destroy", :team_id => "1", :id => "1")
    end
  end
end

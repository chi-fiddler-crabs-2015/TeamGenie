require "rails_helper"

RSpec.describe UsersController, :type => :routing do
  describe "routing" do
    it "routes to #index" do
      expect(:get => "/users").to route_to("users#index")
    end

    it "routes to #new" do
      expect(:get => "/users/new").to route_to("users#new")
    end

    it "routes to #create" do
      expect(:post => "/users").to route_to("users#create")
    end

    it "routes to #edit" do
      expect(:get => "/users/1/edit").to route_to("users#edit", :id => "1")
    end

    it "routes to #show" do
      expect(:get => "/users/1").to route_to("users#show", :id => "1")
    end

    it "routes to #update" do
      expect(:put => "/teams/1").to route_to("teams#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/teams/1").to route_to("teams#destroy", :id => "1")
    end

    it "routes to #roster" do
      expect(:get => "/teams/1/roster").to route_to("teams#roster", :team_id => "1")
    end

    it "routes to ##distribute_dues" do
      expect(:put => "/teams/1/distribute_dues").to route_to("teams#distribute_dues", :team_id => "1")
    end
  end
end

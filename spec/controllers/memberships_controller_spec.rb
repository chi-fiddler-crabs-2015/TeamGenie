require 'rails_helper'

RSpec.describe MembershipsController, type: :controller do
  let!(:user) { create(:user) }
  let!(:location) { create(:location) }
  let!(:team) { user.teams.create!(name: "DBC", activity: "soccer",  home_location: location) }

  before(:each) do
    allow_any_instance_of(MembershipsController).to receive(:current_user).and_return(user)
  end

  context "PUT #mark_paid" do
    it 'assigns @games to all games' do
      membership = user.memberships.create(team: team)
      expect(membership.paid).to be false
      put :mark_paid, :membership_id => membership.id, :team_id => team.id
      expect(membership.paid).to be true
    end
  end


end
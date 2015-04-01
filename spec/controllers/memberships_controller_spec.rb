require 'rails_helper'

RSpec.describe MembershipsController, type: :controller do
  let!(:user) { create(:user) }
  let!(:location) { create(:location) }
  let!(:team) { user.teams.create!(name: "DBC", activity: "soccer",  home_location: location) }

  before(:each) do
    allow_any_instance_of(MembershipsController).to receive(:current_user).and_return(user)
  end

  context "PUT #mark_paid" do
    it 'to change membership from unpaid to paid' do
      membership = user.memberships.create(team: team)
      expect(membership.paid).to be false
      expect{
        put :mark_paid, membership_id: membership.to_param, team_id: team.to_param }.to change{membership.paid}.from(false).to(true)
    end
  end

  context "PUT #mark_unpaid" do
    it 'to change membership from paid to unpaid' do
      membership = user.memberships.create(team: team)
      membership.paid = true
      expect(membership.paid).to be true
      expect{
        put :mark_unpaid, membership_id: membership.to_param, team_id: team.to_param }.to change{membership.paid}.from(true).to(false)
    end
  end

  context "POST #destroy" do
    describe "when valid parameters are passed" do
      it "should delete a membership" do
        membership = user.memberships.create(team: team)
        expect {
          delete :destroy, team_id: team.to_param, id: membership.to_param }.to change{Membership.count}.by(-1)
      end
    end
  end

end
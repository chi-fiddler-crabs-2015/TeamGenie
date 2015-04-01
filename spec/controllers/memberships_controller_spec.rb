require 'rails_helper'

RSpec.describe MembershipsController, type: :controller do
  let!(:user) { create(:user) }
  let!(:location) { create(:location) }
  let!(:team) { user.teams.create!(name: "DBC", activity: "soccer",  home_location: location) }
  let!(:membership) {user.memberships.create!(team: team)}

  before(:each) do
    allow_any_instance_of(MembershipsController).to receive(:current_user).and_return(user)
  end

  context "PUT #mark_paid" do
    it 'to change membership from unpaid to paid' do
      expect(membership.paid).to be false
      put :mark_paid, membership_id: membership.id, team_id: team.id
      membership.reload
      expect(membership.paid).to eq true
    end

    it 'should redirect to team roster path' do
      expect(
        put :mark_paid, { membership_id: membership.id, team_id: team.id } ).to redirect_to team_roster_path(membership.team)
    end
  end

  context "PUT #mark_unpaid" do
    it 'to change membership from paid to unpaid' do
      membership.paid = true
      membership.save
      expect(membership.paid).to be true
      put :mark_unpaid, membership_id: membership.id, team_id: team.id
      membership.reload
      expect(membership.paid).to be false
    end

    it 'should redirect to the team roster path' do
      expect(
        put :mark_unpaid, { membership_id: membership.id, team_id: team.id } ).to redirect_to team_roster_path(membership.team)
    end
  end

  context "POST #destroy" do
    describe "when valid parameters are passed" do
      it "should delete a membership" do
        expect {
          delete :destroy, { team_id: team.to_param, id: membership.to_param } }.to change{Membership.count}.by(-1)
      end
    end
  end
end
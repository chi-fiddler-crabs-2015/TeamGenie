require 'rails_helper'

RSpec.describe ApplicationController, type: :controller do
  let!(:user) { create(:user) }
  let!(:location) { create(:location) }
  let!(:team) { user.teams.create!(name: "DBC", activity: "soccer",  home_location: location) }
  before(:each) do
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)
  end

  describe "#find_location" do
    it 'returns the location found when given an id' do
      expect(find_location(1)).to eq(location)
    end
  end
end

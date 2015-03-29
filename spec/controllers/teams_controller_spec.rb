require 'rails_helper'

RSpec.describe TeamsController, type: :controller do
  let(:user) { create(:user) }

  before(:each) do
    allow_any_instance_of(TeamsController).to receive(:current_user).and_return(user)
  end
  context "GET #index" do
    describe 'when valid parameters are passed' do
      it 'should redirect to the teams #index' do
        location = Location.create!(name: "here", address: "351 west hubbard", city: "chicago", state: "il", zip_code: "60604", directions: "turn right and left")
        team = user.teams.create!(name: "DBC", activity: "soccer",  home_location: location)
        get :index
        expect(assigns(:teams)).to eq(Team.all)
      end
    end
  end
end

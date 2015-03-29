require 'rails_helper'

RSpec.describe TeamsController, type: :controller do
  let(:user) { create(:user) }
  let(:location) { Location.create!(name: "here", address: "351 west hubbard", city: "chicago", state: "il", zip_code: "60604", directions: "turn right and left") }
  let(:team) { user.teams.create!(name: "DBC", activity: "soccer",  home_location: location) }

  before(:each) do
    allow_any_instance_of(TeamsController).to receive(:current_user).and_return(user)
  end
  context "GET #index" do
    describe 'when valid parameters are passed' do
      it 'should assign @teams to all teams' do
        get :index
        expect(assigns(:teams)).to eq(Team.all)
      end
    end
  end

  context "GET #new" do
    describe 'when valid parameters are passed' do
      it 'should render the new template' do
        expect(get :new).to redirect_to(new_team)
      end
    end
  end
end

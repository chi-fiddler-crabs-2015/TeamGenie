require 'rails_helper'

RSpec.describe RsvpsController, type: :controller do
  let!(:user) { create(:user) }
  let!(:location) { create(:location) }
  let!(:team) { user.teams.create!(name: "DBC", activity: "soccer",  home_location: location) }
  let!(:membership) { user.memberships.create!(team: team) }
  let!(:game) { team.games.create(game_time: DateTime.now, location: location) }
  let!(:rsvp) { membership.rsvps.create!(game: game) }

  before(:each) do
    allow_any_instance_of(RsvpsController).to receive(:current_user).and_return(user)
  end

  context "UPDATE rsvps#update" do
    it 'to change rsvp from pending to attending' do
      expect(rsvp.attending).to eq "pending"
      put :update, team_id: team.id, game_id: game.id, id: rsvp.id, attendance: "attending", :format => 'js'
      rsvp.reload
      expect(rsvp.attending).to eq "attending"
    end

    it 'to should render template games/_show' do
      expect( put :update, { team_id: team.id, game_id: game.id, id: rsvp.id , :format => 'js' } ).to render_template("games/_show")
    end
  end

end
require 'rails_helper'

feature "Team navigation:" do
  let!(:user) {create(:user)}
  let!(:location) { create(:location) }
  let!(:team) { user.teams.create!(name: "DBC", activity: "soccer",  home_location: location) }
  let!(:team2) { user.teams.create!(name: "Random", activity: "soccer",  home_location: location) }

  before(:each) do
    allow_any_instance_of(TeamsController).to receive(:current_user).and_return(user)
  end

  scenario "when user visits teams index they can add a team" do
    visit teams_path
    expect(page).to have_content("Add Team")
  end

  scenario "when user clicks a button to Add Team they are redirected to the teams/new" do
    visit new_team_path
    expect(page).to have_content("Add new team")
  end

  scenario "when user fills in form information a new team is added" do
    visit new_team_path
    expect {
      fill_in "Name", :with => team.name
      fill_in "Activity", :with => team.activity
      click_button("Sign up")
      }.to change(Team, :count).by(1)
    expect(page).to have_content team.name
  end

  # scenario "when user clicks team name they are taken to the team homepage" do
  #   visit new_team_path
  #   fill_in "Name", :with => team2.name
  #   fill_in "Activity", :with => team2.activity
  #   click_button("Sign up")
  #   click_link("Random")
  #   expect(page).to have_content("Manage Your Team:")
  # end

end
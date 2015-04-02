require 'rails_helper'

feature "Team navigation:" do
  let!(:user) {create(:user)}

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
      fill_in "Name", :with => "Cosmos"
      fill_in "Activity", :with => "Activity"
      click_button("Sign up")
      }.to change(Team, :count).by(1)
    expect(page).to have_content "Cosmos"
  end

end
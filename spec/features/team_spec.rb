require 'rails_helper'

feature "Team navigation:" do
  let!(:user) {create(:user)}

  before(:each) do
    allow_any_instance_of(TeamsController).to receive(:current_user).and_return(user)
  end

  scenario "when user visits homepage user can navigate to login/signup" do
    visit teams_path
    expect(page).to have_content("Add Team")
  end

end
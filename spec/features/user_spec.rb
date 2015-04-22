require 'rails_helper'

feature "User navigation:" do
  let!(:user) {create(:user)}

  before(:each) do
    allow_any_instance_of(UsersController).to receive(:current_user).and_return(user)
  end

  scenario "when user visits homepage user can navigate to login/signup" do
    visit root_path
    expect(page).to have_content("LOG IN")
    expect(page).to have_content("SIGN UP")
  end

  scenario "when user clicks on login it will redirect to the login page" do
    visit root_path
    click_link("LOG IN")
    expect(page).to have_content("Email")
    expect(page).to have_content("Password")
  end

  scenario "when user enters information in the login form they are redirected to my teams" do
    visit "/login"
    fill_in "Email", :with => user.email
    fill_in "Password", :with => user.password
    click_button("Log in")
    expect(page).to have_content("MY TEAMS")
    expect(page).to have_content("LOG OUT")
  end

  scenario "when user enters information in the login screen incorrectly content stays the same" do
    visit "/login"
    fill_in "Email", :with => user.email
    fill_in "Password", :with => "wrongpassword"
    click_button("Log in")
    expect(page).to have_content("Email")
    expect(page).to have_content("Password")
  end

  scenario "when a user logs out they are redirected back home" do
    visit "/login"
    fill_in "Email", :with => user.email
    fill_in "Password", :with => user.password
    click_button("Log in")
    click_link("LOG OUT")
    expect(page).to have_content("LOG IN")
    expect(page).to have_content("SIGN UP")
  end

  scenario "when the user opens the team join form after an email invitation to join" do
    team = user.teams.create!(name: 'test', activity: 'test')
    visit team_join_from_invitation_path(team)
    expect(page).to have_content("Birthday")
  end

  scenario "user will be redirected to their teams page after editing information" do
    team = user.teams.create!(name: 'test', activity: 'test')
    visit team_join_from_invitation_path(team)
    fill_in "Email", :with => "email@email.com"
    fill_in "Username", :with => "testuser"
    fill_in "user[first_name]", :with => "testuser"
    fill_in "user[last_name]", :with => "testuser"
    fill_in "user[phone_number]", :with => "1234567890"
    fill_in "Password", :with => "newpassword"
    click_button("Sign up")
    expect(page).to have_content("MY TEAMS")
    expect(page).to have_content("LOG OUT")
  end
end


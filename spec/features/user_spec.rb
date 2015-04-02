require 'rails_helper'

feature "User navigating to the home page" do

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
    visit login_path
    fill_in

  end
end
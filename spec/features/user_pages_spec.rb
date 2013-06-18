require 'spec_helper'

feature "Guest user inspects user pages" do
  let(:base_title) { "Social Tennis" }
  let(:user) { FactoryGirl.create(:user) }

  scenario "by visiting signup page" do
    visit signup_path

    expect(page).to have_title("#{base_title} | Sign Up")
    expect(page).to have_content("Sign Up")
  end

  scenario "by visiting user profile page" do
    visit user_path(user)

    expect(page).to have_selector('h1', text: user.name)
    expect(page).to have_title(user.name)
  end
end

feature "Guest user trys to sign up" do
  before(:each) { visit signup_path }
  let(:submit) { "Create my account" }

  scenario "with invalid information" do
    expect { click_button submit }.not_to change(User, :count)
  end

  scenario "with valid information" do
    fill_in "Name",         with: "Example User"
    fill_in "Email",        with: "user@example.com"
    fill_in "Password",     with: "foobar"
    fill_in "Confirmation", with: "foobar"

    expect { click_button submit }.to change(User, :count).by(1)
  end
end


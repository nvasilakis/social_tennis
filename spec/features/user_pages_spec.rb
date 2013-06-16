require 'spec_helper'

feature "Guest user inspects user pages" do
  let(:base_title) { "Social Tennis" }

  scenario "by visiting signup page" do
    visit signup_path

    expect(page).to have_title("#{base_title} | Sign Up")
    expect(page).to have_content("Sign Up")
  end
end

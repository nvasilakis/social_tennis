require 'spec_helper'


feature  "Guest user inspects pages" do
  let(:base_title) { "Social Tennis"}

  scenario "by visting 'Home' page" do
    visit root_path

    expect(page).to have_title("#{base_title} | Home")
    expect(page).to have_content('Social Tennis')
  end

  scenario "by visiting 'About' page" do
    visit about_path

    expect(page).to have_title("#{base_title} | About")
    expect(page).to have_content("About")
  end

  scenario "by visiting 'Contact Us' page" do
    visit contact_path

    expect(page).to have_title("#{base_title} | Contact")
    expect(page).to have_content("Contact Us")
  end
end

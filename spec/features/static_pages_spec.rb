require 'spec_helper'


feature  "Home page" do
  let(:base_title) { "Social Tennis"}

  scenario "User visits Home page" do
    visit '/static_pages/home'

    expect(page).to have_title("#{base_title} | Home")
    expect(page).to have_content('Social Tennis')
  end

  scenario "has the content 'About'" do
    visit '/static_pages/about'

    expect(page).to have_title("#{base_title} | About")
    expect(page).to have_content("About")
  end

  scenario "has the content 'Contact Us'" do
    visit '/static_pages/contact'

    expect(page).to have_title("#{base_title} | Contact")
    expect(page).to have_content("Contact Us")
  end
end

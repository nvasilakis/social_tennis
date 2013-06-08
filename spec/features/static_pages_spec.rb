require 'spec_helper'

  feature  "Home page" do
    
    scenario "should have the content 'Social Tennis'" do
      visit '/static_pages/home'
      expect(page).to have_content('Social Tennis')
    end
  end
  

 feature "About page" do
     
   scenario "should have the content 'About'" do
     visit '/static_pages/about'
     expect(page).to have_content('About')
   end
 end

 feature "Contact Us page" do

   scenario "should have the content 'Contact Us'" do
     visit '/static_pages/contact'
     expect(page).to have_content('Contact Us')
   end
 end

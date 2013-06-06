require 'spec_helper'

describe "StaticPages" do
  
  describe "Home page" do
    
    it "should have the content 'Social Tennis'" do
      visit '/static_pages/home'
      page.should have_content('Social Tennis')
    end
  end
end

require 'spec_helper'

describe "Pages" do
  describe "GET /pages" do
    it "works! (now write some real specs)" do
      # Run the generator again with the --webrat flag if you want to use webrat methods/matchers
      # get 'pages/home'
      visit '/pages/home'
      expect(page).to have_content('HOME')
      #response.status.should be(200)
    end
    it "should have the right title" do
	  visit '/pages/home'
	  expect(page).to have_title("Motivame | Home")
	end
  end
  describe "Help page" do

    it "should have the content 'Help'" do
      visit '/pages/help'
      expect(page).to have_content('Help')
    end
  end

  describe "About page" do

    it "should have the content 'About Us'" do
      visit '/pages/about'
      expect(page).to have_content('About Us')
    end
  end


end

require 'spec_helper'

describe "Pages" do
  subject { page }
  describe "Home/Root page" do
    before {get root_path}
    it { response.status.should be (200)}
    #it "exist and is OK" do
      # Run the generator again with the --webrat flag if you want to use webrat methods/matchers
      #visit '/pages/home'
      #expect(page).to have_content('HOME')
      #get home_path      
      #response.status.should be(200)
    #end   
  end
  describe "Help page" do
    it "exist and is OK" do
      get help_path
      response.status.should be(200)
    end
  end

  describe "About page" do
    it "exist and is OK" do
      get about_path
      response.status.should be(200)
    end
  end

  describe "Contact page" do
    it "exist and is OK" do
      get contact_path
      response.status.should be(200)
    end
  end

end

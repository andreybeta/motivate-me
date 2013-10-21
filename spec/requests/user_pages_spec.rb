require 'spec_helper'

describe "UserPages" do
  subject { page }

  describe "GET /user_pages" do
    it "existe" do
      # Run the generator again with the --webrat flag if you want to use webrat methods/matchers
      get signup_path
      response.status.should be(200)
    end
  end

  describe "profile page" do
    let(:user) { FactoryGirl.create(:user) }
    before { visit user_path(user) }

    it { should have_content(user.name) }
    #it { should have_title(user.name) }
  end

  describe "signup page" do
    before { visit signup_path }

    it { should have_content('Sign Up') }
    #it { should have_title(full_title('Sign up')) }
  end
  describe "Sign Up" do
    before { visit signup_path }
    let(:submit){"Create my Account"}
    
    describe "Invalid data" do
      it "should not create user" do
        expect {click_button submit}.not_to change(User, :count)
      end
    end
  
    describe "with valid information" do
      before do
        fill_in "Name",         with: "Example User"
        fill_in "Email",        with: "user@example.com"
        fill_in "Password",     with: "foobar", :match => :prefer_exact
        fill_in "Confirmation", with: "foobar"
        #fill_in "password_confirmation", with: "foobar"
      end

      it "should create a user" do
        expect { click_button submit }.to change(User, :count).by(1)
      end
    end
  end
end

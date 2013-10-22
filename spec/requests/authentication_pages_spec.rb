require 'spec_helper'

describe "AuthenticationPages" do
  
  describe "SignIn" do    
    before{visit signin_path}
    subject {page}
    
    describe "with valid information" do
      let(:user){FactoryGirl.create(:user)}
      before do
        fill_in "Email", with: user.email.upcase
        fill_in "Password", with: user.password
        click_button "Sign in"
      end

      it { should have_title('Motivame | ' + user.name) }
      it { should have_content(user.name) }
      it { should have_link('Profile',     href: user_path(user)) }
      it { should have_link('Sign out',    href: signout_path) }
      it { should_not have_link('Sign in', href: signin_path) }
    end

    describe "with invalid information" do
      it { should have_content('Sign In') }
      #it { should have_selector('div.alert.alert-error', text: 'Invalid') }

      describe "after visiting another page" do
        before { click_link "Home" }
        it { should_not have_selector('div.alert.alert-error') }
      end
    end
  end
end

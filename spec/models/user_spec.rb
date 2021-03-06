require 'spec_helper'

describe User do
	before do
		@user = User.new(name: "Test User", email:"user@test.com",
			password: "foobar", password_confirmation: "foobar")
	end

	subject{@user}
	it {should respond_to(:name)}
	it {should respond_to(:email)}
	it {should respond_to(:password_digest) }
	it { should respond_to(:password) }
 	it { should respond_to(:password_confirmation) }
 	it { should respond_to(:remember_token) }
 	it { should respond_to(:authenticate) }

	it{should be_valid}
	
	describe "when password is not present" do
		before do
	    	@user = User.new(name: "Example User", email: "user@example.com",
	                       password: " ", password_confirmation: " ")
		end
		it { should_not be_valid }
	end

	describe "when password doesn't match confirmation" do
		before { @user.password_confirmation = "mismatch" }
		it { should_not be_valid }
	end
	
	describe "remember token" do
    before { @user.save }
    its(:remember_token) { should_not be_blank }
  end
  #pending "add some examples to (or delete) #{__FILE__}"
end

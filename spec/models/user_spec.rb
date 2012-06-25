require 'spec_helper'

describe User do

	before { @user = User.new(username: "ren", email: "ren@ren.com", password: "123qwe", password_confirmation: "123qwe" ) }

	subject { @user }

	it { should respond_to(:username) }
	it { should respond_to(:email) }
	it { should respond_to(:password) }
	it { should respond_to(:password_digest) }
	it { should respond_to(:password_confirmation) }

	it { should be_valid }


#-------------------------------------------------------------------------
# Username
#-------------------------------------------------------------------------

	describe "when username is not present" do
		before { @user.username = "" }
		it { should_not be_valid }
	end

	describe "when username is too long" do
		before { @user.username = "a" * 51 }
		it { should_not be_valid }
	end


#-------------------------------------------------------------------------
# Password
#-------------------------------------------------------------------------

	describe "when password does not match" do
		before { @user.password_confirmation = "mismatch" }
		it { should_not be_valid }
	end

	describe "when password is nil" do
		before { @user.password_confirmation = nil }
		it { should_not be_valid }
	end

	describe "when password is not present" do
		before { @user.password = @user.password_confirmation = "" }
		it { should_not be_valid }
	end



#-------------------------------------------------------------------------
# Email
#-------------------------------------------------------------------------
		
	describe "when email is not present" do
		before { @user.email = "" }
		it { should_not be_valid }
	end

	describe "invalid email address format" do
		it "should be invalid" do
			addresses = %w[ren@ren,com ren@ren+com ren@ren@ren@ren.com.com]
			addresses.each do | invalid_email |
				@user.email = invalid_email
				@user.should_not be_valid
			end
		end
	end

	describe "valid email address format" do
		it "should be valid" do
			addresses = %w[ren@ren.com ren@ren.org ren@ren.net a+b@ren.com]
			addresses.each do | valid_email |
				@user.email = valid_email
				@user.should be_valid
			end
		end
	end

	describe "duplicate email addresses" do
		before do
			duplicate_user_email = @user.dup
			duplicate_user_email.email = @user.email.upcase
			duplicate_user_email.save
		end
		it { should_not be_valid }
	end

end
	
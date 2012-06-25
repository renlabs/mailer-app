require 'spec_helper'

describe "AuthenticationPages" do
	subject { page }

  describe "sign in page" do
  	before { visit signin_path }

  	# describe 'with valid information' do
  	# 	let(:user) { FactoryGirl.create(:user) }
  		
  	# 	before do 
  	# 		fill_in 'Username', with: user.Username
  	# 		fill_in 'Password', with: user.password
  	# 		click_button 'Sign in'
  	# 	end
  	# end

  	describe 'with invalid information' do
  		before { click_button 'Sign in' }
			it { should have_selector 'title', text: full_title("Sign in") }
    	it { should have_selector 'h1', text: "Sign in"}
    	it { should have_selector 'div.alert.alert-error', text: "Invalid"}
    end

  end
end

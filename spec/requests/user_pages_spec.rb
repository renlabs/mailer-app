require 'spec_helper'

describe "User pages" do


	subject { page }

  # describe "sign up page" do
  # 	before { visit signup_path }
    
  #   it { should have_selector 'h1', text: 'Sign up' }
  #   it { should have_selector 'title', text: 'Sign up' }
  # end

  describe 'profile page' do
  	let(:user) { FactoryGirl.create(:user) }
    before { visit user_path(user) }

  	it { should have_selector 'h1',    text: user.username }
		it { should have_selector 'title', text: full_title(user.username) }  
  end

end

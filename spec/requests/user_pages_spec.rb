require 'spec_helper'

describe "User pages" do


	subject { page }

  describe "sign up page" do
  	before { visit signup_path }
    let(:submit) { "Create account" }
    
    it { should have_selector 'h1',    text: 'Sign up' }
    it { should have_selector 'title', text: 'Sign up' }

    describe "with invalid information" do 
      it "should not create user" do
        expect { click_button submit }.not_to change(User,:count)
      end  
    end

    describe "with valid information" do
      before do
        fill_in "Username",              with: 'ren'
        fill_in "Email",                 with: 'ren@ren.com'
        fill_in "Password",              with: '123456'
        fill_in "Password confirmation", with: '123456'
      end

      it "should create user" do
        expect { click_button submit }.to change(User, :count).by(1)
      end
    end
  end

  describe 'profile page' do
  	let(:user) { FactoryGirl.create(:user) }
    before { visit user_path(user) }

  	it { should have_selector 'h1',    text: user.username }
		it { should have_selector 'title', text: full_title(user.username) }  
  end

end

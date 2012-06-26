require 'spec_helper'

describe "User pages" do


	subject { page }


#------------------------------------------------------------------------
# Sign up page
#------------------------------------------------------------------------

  describe "sign up page" do
  	before { visit signup_path }
    let(:submit) { "Create account" }
    
    it { should have_selector 'h1',    text: 'Sign up' }
    it { should have_selector 'title', text: 'Sign up' }

    #------------------------------------------------------------------------
    # Invalid information
    #------------------------------------------------------------------------

    describe "with invalid information" do 
      it "should not create user" do
        expect { click_button submit }.not_to change(User,:count)
      end

      describe "after submission" do
        before { click_button submit }

        it { should have_content "error" }
        it { should have_selector 'title', text: full_title("Sign up") }
      end  
    end

    #------------------------------------------------------------------------
    # Valid information
    #------------------------------------------------------------------------
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

      describe "after save" do
        before { click_button submit }
        let(:user) { User.find_by_email('ren@ren.com') }

        it { should  have_selector 'title', text: full_title(user.username) }
        it { should have_selector 'div.alert.alert-success', text: 'Welcome' }
      end

    end
  end # end of sign up

#------------------------------------------------------------------------
# Profile Page
#------------------------------------------------------------------------
  describe 'profile page' do
  	let(:user) { FactoryGirl.create(:user) }
    before { visit user_path(user) }

  	it { should have_selector 'h1',    text: user.username }
		it { should have_selector 'title', text: full_title(user.username) }  
  end

end

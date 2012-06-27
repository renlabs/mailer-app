require 'spec_helper'

describe "AuthenticationPages" do
	subject { page }


#--------------------------------------------------------------------
# Sign in page
#--------------------------------------------------------------------

  describe "sign in page" do
  	before { visit signin_path }

    it { should have_selector 'h1',    text: 'Sign in' }
    it { should have_selector 'title', text: full_title('Sign in') }

    #--------------------------------------------------------------------
    # Valid information
    #--------------------------------------------------------------------

  	describe 'with valid information' do
      before { click_button "Sign in" }
  
  		let(:user) { FactoryGirl.create(:user) }
  		
  		before do 
  			fill_in 'Username', with: user.username
  			fill_in 'Password', with: user.password
  			click_button 'Sign in'
  		end

      it { should have_selector 'title',   text: full_title(user.username) }
      it { should have_link 'Profile',     href: user_path(user) }
      it { should have_link 'Sign out',    href: signout_path }
      it { should_not have_link 'Sign in', href: signin_path }

      describe "followed by signout" do
        before { click_link "Sign out" }
        it { should have_link 'Sign in',   href: signin_path }
      end

  	end

    #--------------------------------------------------------------------
    # Invalid information
    #--------------------------------------------------------------------

  	describe 'with invalid information' do
  		before { click_button 'Sign in' }
			it { should have_selector 'title', text: full_title("Sign in") }
    	it { should have_selector 'h1', text: "Sign in"}
    	it { should have_selector 'div.alert.alert-error', text: "Invalid"}
      
      describe 'after visiting another page' do
        before { click_link "Home" }

        it { should_not have_selector('div.alert.alert-error') }
      end
    end

  end #end of sign in page

  
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
        it { should have_link 'Sign out', href: signout_path }
      end

    end
  end # end of sign up
end

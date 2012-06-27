require 'spec_helper'

describe "User pages" do

	subject { page }

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

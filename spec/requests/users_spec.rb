require 'spec_helper'

describe "Users" do

  let(:base_title) { "Mailer Application | " }
  subject { page }


#-------------------------------------------------------------
# Sign in
#-------------------------------------------------------------

  describe "GET /users" do
    before { get root_path }
    it "works! (now write some real specs)" do
      # Run the generator again with the --webrat flag if you want to use webrat methods/matchers
      response.status.should be(200)
    end
  end

  describe "user sign in" do
  	it "should sign in the user" do
  		visit signin_path
  	end
  end

end

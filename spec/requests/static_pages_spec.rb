require 'spec_helper'

describe "StaticPages" do

  subject { page }

  let(:base_title) { "" }

  shared_examples_for "all static pages" do
  	it { should have_selector('h1',    text: heading) }
    it { should have_selector('title', text: full_title(page_title)) }
  end

#-------------------------------------------------------------
# Contacts
#-------------------------------------------------------------
  describe "contacts" do

    before { visit contacts_path }
    	let(:heading)    { 'Contacts' }
    	let(:page_title) { 'Contacts' }

    	it_should_behave_like "all static pages"
  end

#-------------------------------------------------------------
# Home
#-------------------------------------------------------------
  describe "home" do

    before { visit home_path }
    	let(:heading) 	 { 'Home' }
    	let(:page_title) { '' }

    it_should_behave_like "all static pages"
    it { should_not have_selector 'title', text: '| Home' }
   end

#-------------------------------------------------------------
# About
#-------------------------------------------------------------
  describe "about" do

    before { visit about_path }
    	let(:heading) 	 { 'About' }
    	let(:page_title) { 'About' }

    it_should_behave_like "all static pages"
  end


#-------------------------------------------------------------
# Links on the Layout
#-------------------------------------------------------------
	describe "links" do
		it "should have the right links on the layout" do
			visit root_path
			click_link "About"
			page.should have_selector 'title', text: full_title('About')
			click_link "Contact"
			page.should have_selector 'title', text: full_title('Contacts')
			click_link "Users"
			page.should have_selector 'title', text: full_title('Users')
		end
	end

end

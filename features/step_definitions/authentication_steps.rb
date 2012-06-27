include ApplicationHelper

Given /^a user visits the sign in page$/ do
  visit signin_path
end

When /^he submits an invalid sign in information$/ do
  click_button "Sign in"
end

Then /^he should see an error message$/ do
  page.should have_selector 'div.alert.alert-error', text: "Invalid"
end

Given /^he has an account$/ do
  @user = User.create(username: "ren", email: "ren@ren.com", password: "renren", 
  										password_confirmation: "renren")
end

Given /^the user submits a valid signin information$/ do
  fill_in "Username", with: @user.username
  fill_in "Password", with: @user.password
  click_button "Sign in"
end

Then /^he should see his profile page$/ do
  page.should have_selector 'title', text: full_title(@user.username)
end

Then /^he should see a signout link$/ do
  page.should have_link 'Sign out'
end

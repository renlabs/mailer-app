Feature: Signin in

Scenario: Unsuccessful sign in
Given a user visits the sign in page 
When he submits an invalid sign in information
Then he should see an error message

Scenario: Successsful sign in
Given a user visits the sign in page
And he has an account
And the user submits a valid signin information
Then he should see his profile page
And he should see a signout link
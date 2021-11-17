Feature: Users actions
Scenario: Users want to see their profile
Given I created a user
And I am on the users page
When I clicked show
Then I should see edit and back
When I clicked back
Then I should go back to users page

Scenario: Users want to delete their profile
Given I created a user
And I am on the users page
When I clicked destroy user 1
Then I see a message that I successfully deleted the user

Scenario: Users want to update their profile
Given I created a user
And I am on the users page
When I clicked edit user 1
Then I should see Update User
When I clicked Update User
Then I should see User was successfully updated.

Scenario: Users want to create new user for themselves
Given I am on the users page
And I clicked New User
Then I should see create user button
And I clicked create user
Then I should see User was successfully created.
When I clicked back
And I clicked New User
And I clicked create user
Then I should see User was successfully created.


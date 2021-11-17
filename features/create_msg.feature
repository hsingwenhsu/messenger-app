Feature: Create messages
Scenario: Users want to delete a message
Given the user is on the home page
Then the user creates a room 
Given the user is in the room 
And the user creates a message Hehehe
Then the user should see a message Hehehe
And the user click the destroy button of Hehehe
Then the user should not see a message Hehehe
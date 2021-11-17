Feature: Users can create room
Scenario: Users want to create new room to chat
Given I am on the home page
And I have logged in
When I typed new_room inside add room section
And I clicked Add
Then I should enter the chat room with new_room
And I should see new_room on the page
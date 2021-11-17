Feature: The user can chat
Scenario: The user wants to chat in a room
Given I am on the home page
When I typed new_room inside add room section
And I clicked Add
Then I should enter the chat room with new_room
And I should see new_room on the page
Then I typed Hello inside the message box
And I clicked add message
Then I should see message: Hello on the page
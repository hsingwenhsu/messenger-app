Feature: Users can create room
Scenario: Users want to create new room to chat
Given I am on the room page
And I have logged in
When I typed new_room inside add room section
And I clicked Add
Then I should enter the chat room with new_room
And I should see new_room on the page
Given I am on the room page
When I clicked edit new_room
Then I should enter edit page
When I renamed the room to be 1122
And I clicked Add
Then I should enter the chat room with 1122


Given I am on the room page
And I clicked delete new_room
Then I should not see new_room on rooms page




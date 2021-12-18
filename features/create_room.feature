Feature: Users can create room
Scenario: Users want to create new room to chat
Given I am on the room page
And I have logged in
When I typed new_room inside add room section
And I clicked Add
And I should see new_room on the page
Then I typed weee into the message box
Then I clicked Add Message
Then I should see weee on the room page


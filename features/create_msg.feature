Feature: Create messages
Scenario: Users want to delete a message
Given I am on the room page
And I have logged in 
When I typed new_room inside add room section
And I clicked Add
Then I should enter the chat room with new_room
And I create a message whyyyyy
Then I should see a message whyyyyy
And I click the delete button of whyyyyy
Then I should not see whyyyyy
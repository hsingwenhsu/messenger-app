Feature: Users can edit their enrollment
Scenario: Users want to edit their enrollment
Given I am on the room page
And I have logged in
When I typed new_room inside add room section
And I clicked Add
Then I should enter the chat room with new_room

When I clicked my_name
Then I should go to my enrollment page
When I clicked show
Then I should see the enrollment information
When I clicked destroy
Then I should not see the room

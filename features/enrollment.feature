Feature: Users can edit their enrollment
Scenario: Users want to edit their enrollment
Given I am on the room page
And I have logged in
When I typed new_room inside add room section
And I clicked Add
Then I should enter the chat room with new_room

Then I visited the room page
And I add new_room to my enrollment
And I clicked my_name
Then I should go to my enrollment page
When I clicked show
Then I should see the enrollment information
Then I go back to the enrollment page
When I clicked destroy
Then I should not see the room

Feature: Users can create room
Scenario: Users want to create new room to chat
Given I am on the room page
And I have logged in
When I typed new_room inside add room section
And I clicked Add
And I should see new_room on the page
<<<<<<< HEAD
Then I typed weee into the message box
Then I clicked Add Message
Then I should see weee on the room page
=======
Given I am on the room page
When I clicked go to edit new_room link
Then I should enter edit page
When I renamed the room to be 1122
And I clicked Add
Then I should enter the chat room with 1122

>>>>>>> d183e90ac5662927f90a00b0ce8ae229f061b578


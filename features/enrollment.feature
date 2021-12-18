Feature: Users can edit their enrollment
Scenario: The user wants to edit their enrollment
Given I am on the room page
And I have logged in
When I typed new_room inside add room section
And I clicked Add
And I should see new_room on the page
Then I clicked on Add Course
And I clicked my_name
Then I should go to my enrollment page
Then I should see the course that I added
When I clicked show for the enrollment
Then I should see the enrollment information
Then I go back to the enrollment page
When I clicked destroy
Then I should not see the room

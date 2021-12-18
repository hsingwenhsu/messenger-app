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

Given I am on the room page
And I clicked update for the room I just created
Then I should be on the edit page of the room
Then I fill in a new title for the room
Then I clicked submit to change the room 
Then I should be in the room with the new name

Given I am on the room page 
And I typed in the room name I just created into the search bar
And I clicked submit to search


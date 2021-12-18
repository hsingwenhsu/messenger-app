Feature: Create Event and Send Message In an Event
Scenario: User wants to create an event and send messag to the event
Given I am on the room page
And I have logged in
When I typed esaas inside add room section
And I clicked Add
Then I should enter the chat room with esaas
Then I should see Create Event on the page
And I fill out information of the event
And I clicked submit to create the event
Then I should be on the page of the event
Then I typed helllllllp into the message box
Then I clicked Add Message
Then I should see helllllllp on the event page

Then I visit the event page
Then I click on edit for the event I just created
Then I should be on the edit page 
Then I change the title of the event
Then I change the date of the event
Then I change the start time of the event
Then I change the end time of the event
Then I click submit to change the event
Then I should be in the event room with the new name

Then I visit the event page
Then I clicked on destroy for the event I just created 
Then I should not see the event on the page 
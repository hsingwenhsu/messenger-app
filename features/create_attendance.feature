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

When I clicked view event
Then I should see the codio event
And After I clicked attend event
When I should be located at the enrollment/event page with my event added

When I clicked show event
And I should see the title codio

When I clicked the destroy button
Then I should not see codio on my attendance anymore


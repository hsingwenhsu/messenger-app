Feature: Users can do private message when checking out posts
Scenario: Users want enter post using existing rooms
Given I am on the room page
And I have logged in
When I typed new_room inside add room section
And I clicked Add
And I should see new_room on the page
When I clicked View Posts
Then I can see there is not any posts inside

When I clicked New Post
Then I can see New Post on the page
When I filled the title with test_title
And I filled the content with test_content
And I clicked Create Post
Then I should see test_title on the page
Then I should see my own name, Test, on the page

When I clicked my own name
Then I will enter a private message room
Then I can see the people I want to talk to
And When I typed hello my friend
And I clicked send message
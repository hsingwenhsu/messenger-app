Feature: Users can create post after logging in
Scenario: Users want to create new post for a room/course
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

When I clicked edit post
Then I should see edit post on page
And when I changed the content to test_after_change
And I clicked update post
Then I should see test_after_change

When I clicked delete post
Then I should not see test_after_change anymore

When I clicked back to room
Then I will be directed back to original room



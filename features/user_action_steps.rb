Given ('I created a user') do
    new_user = User.create(username: "testing name") # Write code here that turns the phrase above into concrete actions
end

And('I am on the users page') do
    visit '/users' # Write code here that turns the phrase above into concrete actions
  end

When('I clicked show') do
    puts page.body
    click_link('show_user') # Write code here that turns the phrase above into concrete actions
end

Then('I should see edit and back') do
    page.should have_content("Edit | Back") 
    #page.should have_content("back")# Write code here that turns the phrase above into concrete actions
  end


When('I clicked back') do
    click_link('Back')
     # Write code here that turns the phrase above into concrete actions
  end
  
Then('I should go back to users page') do
    page.should have_content("Log in with Google") 
    
 # Write code here that turns the phrase above into concrete actions
end

When('I clicked destroy') do
  
  click_link('Destroy')
  # Write code here that turns the phrase above into concrete actions
end

Then('I see a message that I successfully deleted the user') do
  page.should have_content("User was successfully destroyed.")  # Write code here that turns the phrase above into concrete actions
end


Then('I should not see user on the page') do
  page.should have_no_content("Show") # Write code here that turns the phrase above into concrete actions
end

Given('I clicked New User') do
  click_link('New User') # Write code here that turns the phrase above into concrete actions
end

Then('I should see create user button') do
  page.should have_content("New User")# Write code here that turns the phrase above into concrete actions
end

Then('I clicked create user') do
  
  click_button('user_actions') # Write code here that turns the phrase above into concrete actions
end

Then('I should see User was successfully created.') do
  page.should have_content("User was successfully created.")
  # Write code here that turns the phrase above into concrete actions
end

Then('I should see Username has already been taken') do
  puts page.body
  page.should have_content("Username has already been taken")
   # Write code here that turns the phrase above into concrete actions
end

When('I clicked edit') do
  click_link('Edit') # Write code here that turns the phrase above into concrete actions
end

Then('I should see Update User') do
  page.should have_content("Editing User")
  # Write code here that turns the phrase above into concrete actions
end

When('I clicked Update User') do
  click_button('user_actions') # Write code here that turns the phrase above into concrete actions
end

Then('I should see User was successfully updated.') do
  page.should have_content("User was successfully updated.")
  # Write code here that turns the phrase above into concrete actions
end
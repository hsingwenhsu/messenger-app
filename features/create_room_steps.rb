Given('I am on the room page') do
    visit '/rooms'
end

And('I have logged in') do
  admin = Admin.create!(:uid => "111101028321893", :email => 'hfuhroi@columbia.edu', :full_name => 'Test')
  login_as(admin, :scope => :admin)
  
  visit '/rooms'
  #put page.body
  # page.should have_content("Submit")

end

When('I typed new_room inside add room section') do
    fill_in 'room_name_id', :with => 'new_room'  # Write code here that turns the phrase above into concrete actions
end

And ('I clicked Add') do
    # Write code here that turns the phrase above into concrete actions
    click_button('new_room_submit')
    #put page.body
  end

Then('I should enter the chat room with new_room') do
    #visit '/rooms/1'
     # Write code here that turns the phrase above into concrete actions
     #puts page.body
end

Then('I should see new_room on the page') do
    page.should have_content("new_room")
     # Write code here that turns the phrase above into concrete actions
end

When('I clicked go to edit new_room link') do
  visit '/rooms/1/edit'
  put page.body
  #click_link('edit_room1') # Write code here that turns the phrase above into concrete actions
end

Then('I should enter edit page') do
  page.should have_content("Editing Room") # Write code here that turns the phrase above into concrete actions
end

When('I renamed the room to be {int}') do |int|
  # When('I renamed the room to be {float}') do |float|
  fill_in 'room_name_id', :with => int # Write code here that turns the phrase above into concrete actions
  end

Then('I should enter the chat room with {int}') do |int|
  # Then('I should enter the chat room with {float}') do |float|
    page.should have_content(int) # Write code here that turns the phrase above into concrete actions
  end

# Given('I clicked delete new_room') do
#   click_link('destroy_room1')
# end

# Then('I should not see new_room on rooms page') do
#   page.should have_no_content("new_room")
# end
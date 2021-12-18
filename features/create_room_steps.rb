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
<<<<<<< HEAD
    # visit url
  end

Then('I should see new_room on the page') do  
  page.should have_content("new_room")
=======
    #put page.body
  end

Then('I should enter the chat room with new_room') do
    #visit '/rooms/1'
>>>>>>> d183e90ac5662927f90a00b0ce8ae229f061b578
     # Write code here that turns the phrase above into concrete actions
     #puts page.body
end

<<<<<<< HEAD
Then('I typed weee into the message box') do
  fill_in 'msg-input', :with => 'weee'
=======
Then('I should see new_room on the page') do
    page.should have_content("new_room")
     # Write code here that turns the phrase above into concrete actions
end

When('I clicked go to edit new_room link') do
  visit '/rooms/1/edit'
  put page.body
  #click_link('edit_room1') # Write code here that turns the phrase above into concrete actions
>>>>>>> d183e90ac5662927f90a00b0ce8ae229f061b578
end

Then ('I should see weee on the room page') do
  page.should have_content('weee')
end

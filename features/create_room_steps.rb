$rid
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
    # visit url
  end

Then('I should see new_room on the page') do  
  page.should have_content("new_room")
  $rid = current_url.split('/')[-1]
  puts $rid
     # Write code here that turns the phrase above into concrete actions
     #puts page.body
end

Then('I typed weee into the message box') do
  fill_in 'msg-input', :with => 'weee'
end

Then ('I should see weee on the room page') do
  page.should have_content('weee')
end

And ('I clicked update for the room I just created') do
  click_link('edit_room'+$rid)
end

Then ('I should be on the edit page of the room') do
  page.should have_content('Editing Room')
end

Then ('I fill in a new title for the room') do 
  fill_in 'room_name_id', :with=>'lalala'
end

Then ('I clicked submit to change the room') do
  click_button('new_room_submit')
end

Then ('I should be in the room with the new name') do
  page.should have_content('lalala')
end

And ('I typed in the room name I just created into the search bar') do
  fill_in 'search', :with=>'new_room'
end

And ('I clicked submit to search') do
  click_button('submit-search')
end

And('I should see the room with the new name on the page') do
  puts page.body
  page.should have_content('lalala')
end

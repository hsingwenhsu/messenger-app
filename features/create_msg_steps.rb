Given('the user is on the home page') do
    visit '/rooms'
end

Then('the user creates a room') do
    fill_in 'room_name_id', :with => 'new_room'  # Write code here that turns the phrase above into concrete actions
    click_button('new_room_submit')
end

Given('the user is in the room') do
    visit '/rooms/1'
end

Given('the user creates a message Hehehe') do
    fill_in 'msg_input', :with => 'Hehehe'
    click_button('msg_submit')
    visit '/rooms/1'
end
  
Then('the user should see a message Hehehe') do
    page.should have_content('Hehehe')
end

Then('the user click the destroy button of Hehehe') do
    click_link('Destroy')
end

Then('the user should not see a message Hehehe') do
    page.should !have_content('Hehehe')
end

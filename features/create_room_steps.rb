Given('I am on the home page') do
    visit '/rooms'
end

And('I have logged in') do
  admin = Admin.create!(:uid => "111101028321893", :email => 'hfuhroi@columbia.edu', :full_name => 'Test')
  login_as(admin, :scope => :admin)
  visit '/rooms'
end

When('I typed new_room inside add room section') do
    fill_in 'room_name_id', :with => 'new_room'  # Write code here that turns the phrase above into concrete actions
end

And ('I clicked Add') do
    # Write code here that turns the phrase above into concrete actions
    click_button('new_room_submit')
  end

Then('I should enter the chat room with new_room') do
    visit '/rooms/1'
     # Write code here that turns the phrase above into concrete actions
end

Then('I should see new_room on the page') do
    page.should have_content("new_room")
     # Write code here that turns the phrase above into concrete actions
end
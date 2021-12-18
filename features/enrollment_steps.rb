$rid = 0
$rname = ''
Then('I clicked on Add Course') do
  url = current_url
  $rid = current_url.split('/')[-1]
  $rname = 'new_room'
  puts $rid
  click_button('create_enrollment'+$rid)
  visit url
end

And('I clicked my_name') do
  puts current_url
  click_link('link_to_enrollment')
end

Then('I should go to my enrollment page') do
  page.should have_content("Enrollment")
end

Then('I should see the course that I added') do
  page.should have_content("new_room");
end

When('I clicked show for the enrollment') do 
  eid = page.body.match(/show_enrollment([^\/.]*)" /)
  click_link('show_enrollment'+eid)
end

Then('I should see the enrollment information') do
  page.should have_content("Enrollment Show")
end

Then('I go back to the enrollment page') do
  visit '/enrollments'
end

When('I clicked destroy') do
  click_link('delete_enrollment'+@rid);
end

Then('I should not see the room') do
  page.should !have_content('new_room')
end
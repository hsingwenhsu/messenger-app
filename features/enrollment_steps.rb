Then('I visited the room page') do
  visit '/rooms'
end

And('I add new_room to my enrollment') do
  click_on('create_enrollment1')
  visit '/rooms'
end

And('I clicked my_name') do
  click_link('link_to_enrollment')
end

Then('I should go to my enrollment page') do
  page.should have_content("Enrollment")
end

When('I clicked show') do 
  click_link('show_enrollment1')
end

Then('I should see the enrollment information') do
  page.should have_content("Enrollment Show")
end

Then('I go back to the enrollment page') do
  visit '/enrollments'
end

When('I clicked destroy') do
  click_link('delete_enrollment1');
end

Then('I should not see the room') do
  page.should !have_content('new_room')
end
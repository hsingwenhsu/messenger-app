Then('I typed Hello inside the message box') do
  fill_in 'msg_input', :with => 'Hello'
end

Then('I clicked add message') do
  click_button('msg_submit')
  visit '/rooms/1'
  puts page.body
end

Then('I should see message: Hello on the page') do
  page.should have_content('Hello')
end
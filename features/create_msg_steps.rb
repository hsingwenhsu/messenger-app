Then('I create a message whyyyyy') do
    fill_in 'msg-input', :with => 'whyyyyy'
    click_button('msg-submit')
    visit '/rooms/1'
end
  
Then('I should see a message whyyyyy') do
    page.should have_content('whyyyyy')
end

And('I click the delete button of whyyyyy') do 
    click_link('1')
end

Then('I should not see whyyyyy') do
    page.should !have_content('whyyyyy')
end
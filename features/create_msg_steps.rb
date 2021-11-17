Then('I create a message Hehehe') do
    fill_in 'msg_input', :with => 'Hehehe'
    click_button('msg_submit')
    visit '/rooms/1'
end
  
Then('I should see a message Hehehe') do
    page.should have_content('Hehehe')
end

And('I click the delete button of Hehehe') do 
    click_link('1')
end

Then('I should not see Hehehe') do
    page.should !have_content('Hehehe')
end
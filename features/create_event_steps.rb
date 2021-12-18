$eid = 0
When ('I typed esaas inside add room section') do
    fill_in 'room_name_id', :with=> 'esaas'
end

Then ('I should enter the chat room with esaas') do 
    page.should have_content("esaas")
end

Then ('I should see Create Event on the page') do
    page.should have_content("Create Event")
end

Then ('I fill out information of the event') do
    fill_in 'event-title', :with => 'codio'
    fill_in 'event-date', :with => '2021-12-25'
    fill_in 'event-start', :with => '13:00'
    fill_in 'event-end', :with => '15:00'
end

# Then ('I clicked submit to create the event') do
#     click_button('event-create');
# end

Then ('I should be on the page of the event') do
    page.should have_content('esaas')
    $eid = current_url.split('/')[-1]
end

Then('I typed helllllllp into the message box') do
    fill_in 'msg-input', :with => 'helllllllp'
end

Then ('I clicked Add Message') do 
    url = current_url
    click_button('msg-submit')
    visit url
end

Then ('I should see helllllllp on the event page') do
    page.should have_content('helllllllp')
end


Then ('I visit the event page') do 
    visit '/events'
end

Then ('I click on edit for the event I just created') do
    click_link('edit_event'+$eid)
end

Then ('I should be on the edit page') do
    page.should have_content('Editing Event')
end

Then ('I change the title of the event') do 
    fill_in 'event-title', :with => 'final exam'
end

Then ('I change the date of the event') do 
    fill_in 'event-date', :with => '2022-01-01'
end

Then ('I change the start time of the event') do 
    fill_in 'event-start', :with => '22:00'
end

Then ('I change the end time of the event') do
    fill_in 'event-end', :with => '23:00'
end


Then ('I click submit to change the event') do
    click_button('event-create')
end

Then ('I should be in the event room with the new name') do
    page.should have_content('final')
end

Then ('I clicked on destroy for the event I just created') do
    click_link('delete_event'+$eid)
end

Then ('I should not see the event on the page') do 
    page.should have_no_content('final')
end

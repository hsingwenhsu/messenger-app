$event_id = ''
$attend_id = ''

Then ('I clicked submit to create the event') do
    click_button('event-create');
    $event_id = URI.parse(current_url).path.split('/')[-1].to_s
    #URI.parse(current_url).path[1..-1]  # => "hackerbob"
end

When('I clicked view event') do
    click_link("view-events")
  end

  Then('I should see the codio event') do
    page.should have_content('codio')
  end

  Then('After I clicked attend event') do
    puts page.body
    click_button("create_attendance"+$event_id)
    eid = page.body.match(/show_attendance([^\/.]*)" /)
    $attend_id = eid[1]
    #puts eid[1]
  end

  When('I should be located at the enrollment\/event page with my event added') do
    page.should have_content('codio')
    page.should have_content('My Events')
  end

  When('I clicked show event') do
    #puts page.body
    click_link("show_attendance"+$attend_id)
    visit '/enrollments'
  end

  When('I should see the title codio') do
    #puts page.body
    page.should have_content('codio')
    
    
  end

  When('I clicked the destroy button') do
    click_link("delete_attendance"+$attend_id)
    visit '/enrollments'
  end


Then('I should not see codio on my attendance anymore') do
    page.should have_no_content('codio')
  end
  
Given(/^I am on the homepage$/) do
  visit 'http://localhost:3000/room'
end

Given /the following rooms are created: (.*)/ do |rooms|
  rooms.split(",").each do |room|
    puts(room)
  end
  puts(page.body)
end

Then /^I should see the following rooms: (.*)/ do |rooms|
  rooms.split(",").each do |room|
    if page.respond_to? :should
      expect(page).to have_content(room)
    else
      assert expect(page).to has_content?(room)
    end
  end
end

Then /^I press the room of (.*)$/ do |link|
  #find(link).click_link(link)
  expect(page).to have_content(link)
  click_link(class: link)
end

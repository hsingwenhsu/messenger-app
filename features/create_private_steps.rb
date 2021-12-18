When('I clicked my own name') do
    #page.evaluate_script("document.forms[0].submit()")
   # submit_form "create-private"
    # puts page.body
    click_button("create-private")
  end

  Then('I will enter a private message room') do
    page.should have_content("Sufferers")
  end

Then('I can see the people I want to talk to') do

page.should have_content("Test")
end


Then('When I typed hello my friend') do
    fill_in 'msg-input', :with => 'hello my friend' 
  end

Then('I clicked send message') do
    url = URI.parse(current_url)
    puts url
    click_button('msg-submit')
    visit url
    page.should have_content("hello my friend")
    #puts page.body

end

Then('I will see hello my friend on the page') do
    visit url
    page.should have_content("hello my friend")
  end
  
  
  
When('I clicked View Posts') do
    url = URI.parse(current_url)
    #puts url
    #put page.body
    click_link("view_posts")
  end

  Then('I can see there is not any posts inside') do
    page.should have_content("There are 0 post(s) in")
  end

  When('I clicked New Post') do
    click_link("create_new_post")

  end

  Then('I can see New Post on the page') do
    page.should have_content("New Post")

  end

  When('I filled the title with test_title') do
    fill_in 'new-post-title', :with => 'test_title' 
  end

  When('I filled the content with test_content') do
    fill_in 'new-post-textarea', :with => 'test_content' 
  end

  When('I clicked Create Post') do
    click_button("new-post-submit")
  end

  Then('I should see test_title on the page') do
    page.should have_content("test_title")
  end

  Then('I should see my own name, Test, on the page') do
    page.should have_content("Test")
  end

  When('I clicked edit post') do
    click_link('edit_post')
  end
  
  Then('I should see edit post on page') do
    page.should have_content("Editing Post")
  end

  Then('when I changed the content to test_after_change') do
    fill_in "new-post-textarea", :with => 'test_after_change' 
  end

  Then('I clicked update post') do
    click_button("new-post-submit")
  end

  Then('I should see test_after_change') do
    page.should have_content("test_after_change")
  end

  When('I clicked delete post') do
    click_link('delete_post')

  end

  Then('I should not see test_after_change anymore') do
    page.should have_no_content("test_after_change")
    url = URI.parse(current_url)
  end

  When('I clicked back to room') do
    click_link('back-to-room')
  end

  Then('I will be directed back to original room') do
    page.should have_content("new_room")
  end
  

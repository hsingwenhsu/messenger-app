Given('I exist as a user') do
    visit '/' # Write code here that turns the phrase above into concrete actions
  end
Given('I am not logged in') do
     # Write code here that turns the phrase above into concrete actions
end

When('I sign in with valid credentials') do
    admin = Admin.create!(:uid => "111101028321893", :email => 'hfuhroi@columbia.edu', :full_name => 'Test')
    login_as(admin, :scope => :admin)
    user = Admin.find_by(uid: "111101028321893")

    puts user.full_name
    # puts user.nil?
    # puts user.full_name
    # admin = Admin.from_google({
    #     uid: '1111',
    #     email: 'test@columbia.edu',
    #     full_name: 'test_name',
    #     avatar_url: 'test_url'
    #   }) 
      #sign_in_and_redirect admin, event: :authentication
      # Write code here that turns the phrase above into concrete actions
  end

Then('I see a successful sign in message') do
    visit '/rooms'
    #puts page.body
    page.should have_content("Test") 
     # Write code here that turns the phrase above into concrete actions
end


When('I return to the site') do
    visit '/'
     # Write code here that turns the phrase above into concrete actions
  end
Then('I should be signed in') do
 # Write code here that turns the phrase above into concrete actions
end
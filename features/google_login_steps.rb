
# def registration()
#     uri = URI("https://accounts.google.com/o/oauth2/auth/oauthchooseaccount?access_type=offline&client_id=644389801312-oksodol6bme5uh7fav8r4mbsdkig1k5p.apps.googleusercontent.com&redirect_uri=http%3A%2F%2F127.0.0.1%3A3000%2Fadmins%2Fauth%2Fgoogle_oauth2%2Fcallback&response_type=code&scope=email%20profile&state=d30ea9f080e19c5394038ed48437e920e11956f3240c07e5&flowName=GeneralOAuthFlow")
#     res = Net::HTTP.post_form(uri, 'email' => "an_email@email.com", 'full_name' => 'Testing Name', 'uid' => "1000101010111")
#     puts res.body
#     return 
# #   params = {
# #     :sub => 1000382629,
# #     :email => "an_email@email.com",
# #     :full_name => "my_fullname",
# #     # :picture => "a_valid_thumbnail_picture_url",
# #   }
# #   return Net::HTTP.get("BASE_URL", 
# #     "https://accounts.google.com/o/oauth2/auth/oauthchooseaccount?access_type=offline&client_id=644389801312-oksodol6bme5uh7fav8r4mbsdkig1k5p.apps.googleusercontent.com&redirect_uri=http%3A%2F%2F127.0.0.1%3A3000%2Fadmins%2Fauth%2Fgoogle_oauth2%2Fcallback&response_type=code&scope=email%20profile&state=d30ea9f080e19c5394038ed48437e920e11956f3240c07e5&flowName=GeneralOAuthFlow")
# end 

# Given('I am on the homepage') do
#     visit '/' # Write code here that turns the phrase above into concrete actions
#   end

# Given('I clicked google login') do
#     Capybara.default_host = "https://accounts.google.com"
#     default_url_options[:host] = "https://accounts.google.com"
#     click_link("google_logging_in")
#     puts page.body
#     #registration()
#     #visit 'https://accounts.google.com/o/oauth2/auth/oauthchooseaccount?access_type=offline&client_id=644389801312-oksodol6bme5uh7fav8r4mbsdkig1k5p.apps.googleusercontent.com&redirect_uri=http%3A%2F%2F127.0.0.1%3A3000%2Fadmins%2Fauth%2Fgoogle_oauth2%2Fcallback&response_type=code&scope=email%20profile&state=6c5be9f28021acc6def672afdff6db6b35c7c6ca7f8b484f&flowName=GeneralOAuthFlow' # Write code here that turns the phrase above into concrete actions
# end

# Then('I should be redirected to google site') do
#     pending # Write code here that turns the phrase above into concrete actions
#   end
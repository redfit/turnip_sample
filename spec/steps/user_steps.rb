step 'I should see a signed out message' do
  page.should have_content "Signed out successfully."
end

step 'I sign out' do
  visit '/users/sign_out'
end

step 'I am logged in' do
  step "create user"
  step "sign in"
end

step 'sign in' do
  visit '/users/sign_in'
  fill_in "Email", :with => @visitor[:email]
  fill_in "Password", :with => @visitor[:password]
  click_button "Sign in"
end

step 'I do not exist as a user' do
  step "create visitor"
  step "delete user"
end

step 'I sign in with valid credentials' do
  step "create visitor"
  step "sign in"
end

step 'I see an invalid login message' do
  page.should have_content "Invalid email or password."
end

step 'I should be signed out' do
  page.should have_content "Sign up"
  page.should have_content "Login"
  page.should_not have_content "Logout"
end

step 'I exist as a user' do
  step "create user"
end

step 'I am not logged in' do
  visit '/users/sign_out'
end

step 'I see a successful sign in message' do
  page.should have_content "Signed in successfully."
end

step 'I return to the site' do
  visit '/'
end

step 'I should be signed in' do
  page.should have_content "Logout"
  page.should_not have_content "Sign up"
  page.should_not have_content "Login"
end

step 'I sign in with a wrong email' do
  @visitor = @visitor.merge(:email => "wrong@example.com")
  step "sign in"
end

step "I sign in with a wrong password" do
  @visitor = @visitor.merge(:password => "wrongpass")
  step "sign in"
end

Given("I have a user") do
  @user = FactoryBot.create(:user)
end

When("I go to the login page") do
  visit login_path
end

When("I fill in the user form") do
  fill_in 'Email', with: @user.email
  fill_in 'Password', with: 'password'
end

When("I click on {string}") do |string|
  click_on string
end

Then("I should be on my profile page") do
  expect(page).to have_content('User informations')
end

Then("I should see a flash message indicating {string}") do |string|
  expect(page).to have_content(string)
end
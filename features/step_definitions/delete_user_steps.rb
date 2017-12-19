Given("I have an admin") do
  @admin = FactoryBot.create(:admin)
end

When("I fill in the admin form") do
  fill_in 'Email', with: @admin.email
  fill_in 'Password', with: 'password'
end

When("I go to the user profile page") do
  visit user_path(@user)
end
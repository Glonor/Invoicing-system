

When("I go to the edit profile page") do
  visit edit_user_path(@user)
end

When("I fill in valid user data") do
  fill_in 'user[phone]', with: '1234567892'
end

When("I should see a flash message indicating success updating") do
  expect(page).to have_content('Profile updated')
end
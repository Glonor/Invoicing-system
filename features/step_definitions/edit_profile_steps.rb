When("I go to the edit profile page") do
  visit edit_user_path(@user)
end

When("I fill in valid user data") do
  fill_in 'user[phone]', with: '1234567892'
end

When("I fill in invalid fiscal code") do
  fill_in 'user[fiscal_code]', with:'123'
end

Then("I should have a fiscal code validation error") do
  expect(page).to have_content('is the wrong length (should be 16 characters)')
end
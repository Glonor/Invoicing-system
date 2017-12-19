When("I fill in invalid password") do
  fill_in 'Email', with: 'sterling.archer@gmail.com'
  fill_in 'Password', with: 'password2'
end

Then("I should have a invalid combination error") do
  expect(page).to have_content('Invalid email/password combination')
end

When("I log out manually") do
  click_on 'Log out'
end
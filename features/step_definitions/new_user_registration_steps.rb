When("I go to the new user registration page") do
  visit signup_path
end

When("I fill in the new user form") do
    fill_in 'First name', with: 'Sterling'
    fill_in 'Last name', with: 'Archer'
    fill_in 'Email', with: 'sterling.archer@gmail.com'
    fill_in 'Password', with: 'password1'
    fill_in 'Password confirmation', with: 'password1'
    fill_in 'Fiscal code', with: 'QWERTYUIOP123456'
    fill_in 'Address', with: 'Via Rosmini 3'
    fill_in 'City', with: 'Meano'
    fill_in 'District', with: 'Trento'
    fill_in 'Postal code', with: '38016'
    fill_in 'Phone', with: '1234567890'

    click_on 'Sign up'
end

When("I log out manually") do
  click_on 'Log out'
end

When("I fill in invalid password") do
  fill_in 'Email', with: 'sterling.archer@gmail.com'
  fill_in 'Password', with: 'password2'

  click_on 'Sign in'
end

Then("I should have a invalid combination error") do
  expect(page).to have_content('Invalid email/password combination')
end
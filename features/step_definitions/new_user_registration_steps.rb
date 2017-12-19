When("I go to the new user registration page") do
  visit signup_path
end

When("I fill in the new user form with valid data") do
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
end

When("I fill in the new user form with wrong fiscal code") do
  fill_in 'First name', with: 'Sterling'
  fill_in 'Last name', with: 'Archer'
  fill_in 'Email', with: 'sterling.archer@gmail.com'
  fill_in 'Password', with: 'password1'
  fill_in 'Password confirmation', with: 'password1'
  fill_in 'Fiscal code', with: '123'
  fill_in 'Address', with: 'Via Rosmini 3'
  fill_in 'City', with: 'Meano'
  fill_in 'District', with: 'Trento'
  fill_in 'Postal code', with: '38016'
  fill_in 'Phone', with: '1234567890'
end

When("I fill in the new user form with empty fiscal code") do
  fill_in 'First name', with: 'Sterling'
  fill_in 'Last name', with: 'Archer'
  fill_in 'Email', with: 'sterling.archer@gmail.com'
  fill_in 'Password', with: 'password1'
  fill_in 'Password confirmation', with: 'password1'
  fill_in 'Fiscal code', with: ''
  fill_in 'Address', with: 'Via Rosmini 3'
  fill_in 'City', with: 'Meano'
  fill_in 'District', with: 'Trento'
  fill_in 'Postal code', with: '38016'
  fill_in 'Phone', with: '1234567890'
end

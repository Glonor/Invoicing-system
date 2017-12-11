When ('I go to the clients page') do
  visit clients_path
end
Then ('I am redirected to the new client page') do
  expect(page).to have_content("New client")
end
And ('I fill in the new client form') do
  fill_in 'First name', with: 'Sterling'
  fill_in 'Last name', with: 'Archer'
  fill_in 'Email', with: 'sterling.archer@gmail.com'
  fill_in 'Tariff', with: '11'
  fill_in 'Fiscal code', with: 'QWERTYUIOP123456'
  fill_in 'Address', with: 'Via Rosmini 3'
  fill_in 'City', with: 'Meano'
  fill_in 'District', with: 'Trento'
  fill_in 'Postal code', with: '38016'
  fill_in 'Phone', with: '1234567890'
end

When ('I click on new client icon') do
  click_on(class: 'btn bmd-btn-icon')
end

When("I fill in with empty first_name") do
  fill_in 'First name', with: ''
end

Then("I should have a validation error") do
  expect(page).to have_content('can\'t be blank')
end
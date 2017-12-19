Given("I go to the edit client profile page") do
  visit edit_client_path(@client)
end

When("I fill in valid client data") do
  fill_in 'client[phone]', with: '1234567892'
end

Then("I should be on client profile page") do
  expect(page).to have_content(@client)
end

When("I fill in invalid client fiscal code") do
  fill_in 'client_fiscal_code', with:'123'
end

When("I fill in empty client fiscal code") do
  fill_in 'client_fiscal_code', with:''
end
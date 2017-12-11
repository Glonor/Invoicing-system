Given('I have a client') do
  @client = FactoryBot.create(:client)
end

#Non riesco a risolvere il problema dell'user_id mancante
Given("I go to the edit client profile page") do
  visit edit_client_path(@client)
end

When("I fill in valid client data") do
  fill_in 'client[phone]', with: '1234567892'
end

Then("I should be on client profile page") do
  expect(page).to have_content(@client)
end

Then("I should see a flash message indicating success") do
  expect(page).to have_content('Client was successfully updated.')
end
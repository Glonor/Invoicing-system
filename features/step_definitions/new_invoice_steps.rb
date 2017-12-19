Given("I have an event") do
  @event = FactoryBot.create(:event, client: @client)
end

When("I go to the client profile page") do
  visit client_path(@client)
end

When("an invoice is created to the client") do
  expect(page).to have_content('Invoice was successfully created.')
end


Then("I should see the list of the client's billing total") do
  expect(page).to have_content('12:00 05/12/2017')
end
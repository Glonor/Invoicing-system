Given("I have an event") do
  @event = FactoryBot.create(:event)
end

#Non riesco a risolvere il problema dell'user_id mancante
When("I go to the client profile page") do
  visit client_path(@client)
end

When("an invoice is created to the client") do
  pending # Write code here that turns the phrase above into concrete actions
end


Then("I should see the list of the client's billing total") do
  pending # Write code here that turns the phrase above into concrete actions
end

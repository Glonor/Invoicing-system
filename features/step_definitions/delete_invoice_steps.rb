Given("I have a invoice") do
  @invoice = FactoryBot.create(:invoice, user: @user, client: @client)
  @service = FactoryBot.create(:service, invoice: @invoice)
end

When("I go to the invoice page") do
  visit invoice_path(@invoice)
end
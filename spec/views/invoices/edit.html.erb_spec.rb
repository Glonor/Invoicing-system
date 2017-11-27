require 'rails_helper'

RSpec.describe "invoices/edit", type: :view do
  before(:each) do
    @invoice = assign(:invoice, Invoice.create!(
      :user => nil,
      :client => nil,
      :total_amount => "9.99"
    ))
  end

  it "renders the edit invoice form" do
    render

    assert_select "form[action=?][method=?]", invoice_path(@invoice), "post" do

      assert_select "input[name=?]", "invoice[user_id]"

      assert_select "input[name=?]", "invoice[client_id]"

      assert_select "input[name=?]", "invoice[total_amount]"
    end
  end
end

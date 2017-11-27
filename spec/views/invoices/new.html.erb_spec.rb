require 'rails_helper'

RSpec.describe "invoices/new", type: :view do
  before(:each) do
    assign(:invoice, Invoice.new(
      :user => nil,
      :client => nil,
      :total_amount => "9.99"
    ))
  end

  it "renders new invoice form" do
    render

    assert_select "form[action=?][method=?]", invoices_path, "post" do

      assert_select "input[name=?]", "invoice[user_id]"

      assert_select "input[name=?]", "invoice[client_id]"

      assert_select "input[name=?]", "invoice[total_amount]"
    end
  end
end

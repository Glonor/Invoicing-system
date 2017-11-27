require 'rails_helper'

RSpec.describe "invoices/index", type: :view do
  before(:each) do
    assign(:invoices, [
      Invoice.create!(
        :user => nil,
        :client => nil,
        :total_amount => "9.99"
      ),
      Invoice.create!(
        :user => nil,
        :client => nil,
        :total_amount => "9.99"
      )
    ])
  end

  it "renders a list of invoices" do
    render
    assert_select "tr>td", :text => nil.to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
    assert_select "tr>td", :text => "9.99".to_s, :count => 2
  end
end

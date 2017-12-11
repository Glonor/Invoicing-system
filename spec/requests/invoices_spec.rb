require 'rails_helper'

RSpec.describe "Invoices", type: :request do
  let(:user) {FactoryBot.create(:user)}

  before do
    post login_path, params: { session: { email: user.email,
                                          password: 'password'}}
  end

  describe "GET /invoices" do
    it "works! (now write some real specs)" do
      get invoices_path
      expect(response).to have_http_status(200)
    end
  end
end

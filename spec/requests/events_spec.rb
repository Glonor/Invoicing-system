require 'rails_helper'

RSpec.describe "Events", type: :request do
  let(:user) {FactoryBot.create(:user)}
  let(:client) {FactoryBot.create(:client)}

  before do
    post login_path, params: { session: { email: user.email,
                                          password: 'password'}}
  end

  describe "GET /events" do
    it "works! (now write some real specs)" do
      get client_events_path(client)
      expect(response).to have_http_status(200)
    end
  end
end

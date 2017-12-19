require 'rails_helper'

RSpec.describe EventsController, type: :controller do

  let(:user) {FactoryBot.create(:user)}
  let(:client) {FactoryBot.create(:client)}

  before do
    log_in_as(user)
  end

  let(:valid_attributes) { {
      :title => "MyString",
      :description => "MyText",
      :billed => nil,
      :start_time => "2017-12-05 12:54:00",
      :end_time => "2017-12-05 13:54:00",
      :client_id => client.id
    }
  }

  let(:invalid_attributes) { {
      :title => "MyString",
      :description => "MyText",
      :billed => nil,
      :start_time => "2017-12-05 13:00:00",
      :end_time => "2017-12-05 12:00:00"
    }
  }

  describe "GET #index" do
    it "returns a success response" do
      event = Event.create! valid_attributes
      get :index, params: {client_id: client.id}
      expect(response).to be_success
    end
  end

  describe "GET #show" do
    it "returns a success response" do
      event = Event.create! valid_attributes
      get :show, params: {client_id: client.id, id: event.to_param}
      expect(response).to be_success
    end
  end

  describe "GET #new" do
    it "returns a success response" do
      get :new, params: {client_id: client.id}
      expect(response).to be_success
    end
  end

  describe "GET #edit" do
    it "returns a success response" do
      event = Event.create! valid_attributes
      get :edit, params: {client_id: client.id, id: event.to_param}
      expect(response).to be_success
    end
  end

  describe "POST #create" do
    context "with valid params" do
      it "creates a new Event" do
        expect {
          post :create, params: {client_id: client.id, event: valid_attributes}, format: 'json'
        }.to change(Event, :count).by(1)
      end
    end

    context "with invalid params" do
      it "returns a failure response" do
        post :create, params: {client_id: client.id, event: invalid_attributes}, format: 'json'
        expect(response.body).to include("must be after start date")
      end
    end
  end

  describe "PUT #update" do
    context "with valid params" do
      let(:new_attributes) {
        {
            :title => "NewMyString"
        }
      }

      it "updates the requested event" do
        event = Event.create! valid_attributes
        put :update, params: {client_id: client.id, id: event.to_param, event: new_attributes}, format: 'json'
        event.reload
        expect(response).to be_success
      end
    end

    context "with invalid params" do
      it "returns a failure response" do
        event = Event.create! valid_attributes
        put :update, params: {client_id: client.id, id: event.to_param, event: invalid_attributes}, format: 'json'
        expect(response.body).to include("must be after start date")
      end
    end
  end

  describe "DELETE #destroy" do
    it "destroys the requested event" do
      event = Event.create! valid_attributes
      expect {
        delete :destroy, params: {client_id: client.id, id: event.to_param}
      }.to change(Event, :count).by(-1)
    end
  end

end

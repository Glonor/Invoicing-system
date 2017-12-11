require "rails_helper"

RSpec.describe EventsController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/clients/1/events").to route_to("events#index", :client_id => "1")
    end

    it "routes to #new" do
      expect(:get => "/clients/1/events/new").to route_to("events#new", :client_id => "1")
    end

    it "routes to #show" do
      expect(:get => "/clients/1/events/1").to route_to("events#show", :id => "1", :client_id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/clients/1/events/1/edit").to route_to("events#edit", :id => "1", :client_id => "1")
    end

    it "routes to #create" do
      expect(:post => "/clients/1/events").to route_to("events#create", :client_id => "1")
    end

    it "routes to #update via PUT" do
      expect(:put => "/clients/1/events/1").to route_to("events#update", :id => "1", :client_id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/clients/1/events/1").to route_to("events#update", :id => "1", :client_id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/clients/1/events/1").to route_to("events#destroy", :id => "1", :client_id => "1")
    end

  end
end

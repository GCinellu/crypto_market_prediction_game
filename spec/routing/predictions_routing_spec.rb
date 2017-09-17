require "rails_helper"

RSpec.describe PredictionsController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/predictions").to route_to("predictions#index")
    end

    xit "routes to #show" do
      expect(:get => "/predictions/1").to route_to("predictions#show", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/predictions").to route_to("predictions#create")
    end

    xit "routes to #update via PUT" do
      expect(:put => "/predictions/1").to route_to("predictions#update", :id => "1")
    end

    xit "routes to #update via PATCH" do
      expect(:patch => "/predictions/1").to route_to("predictions#update", :id => "1")
    end

    xit "routes to #destroy" do
      expect(:delete => "/predictions/1").to route_to("predictions#destroy", :id => "1")
    end
  end
end

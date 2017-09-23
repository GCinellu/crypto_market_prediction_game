require "rails_helper"

RSpec.describe PredictedsController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/predicteds").to route_to("predicteds#index")
    end

    it "routes to #show" do
      expect(:get => "/predicteds/1").to route_to("predicteds#show", :id => "1")
    end
  end
end

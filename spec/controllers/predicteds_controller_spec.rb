require 'rails_helper'

RSpec.describe PredictedsController, type: :controller do
  before(:each) do
    User.destroy_all
    Predicted.destroy_all

    @user = FactoryGirl.create(:user_valid)

    request.headers.merge! valid_headers
  end

  let(:valid_headers) {
    {
      "Auth-Token": @user.token
    }
  }

  describe "GET #index" do
    it "returns http success" do
      FactoryGirl.create(:predicted, user: @user)

      get :index
      expect(response).to have_http_status(:success)

      expect(JSON.parse(response.body)['predicteds'].length).to eq @user.predicteds.length
    end
  end

  describe "GET #show" do
    it "returns http success" do
      get :show
      expect(response).to have_http_status(:success)
    end
  end
end

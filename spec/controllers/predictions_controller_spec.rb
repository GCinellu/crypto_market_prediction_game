require 'rails_helper'

RSpec.describe PredictionsController, type: :controller do
  before(:each) do
    User.destroy_all
    Prediction.destroy_all

    @user = FactoryGirl.create(:user_valid)

    request.headers.merge! valid_headers
  end

  let(:valid_attributes) {
    {
      coin: 'BTC',
      exchange: 'Coinbase',
      currency: 'USD',
      prediction_type: 'Absolute',
      change_in_price: 300,
      expiring_at: Time.now + 40
    }
  }

  let(:invalid_attributes) {
    {
      coin: 'XYYYX',
      exchange: 'Somewhere never herd of',
      currency: 'USDDDX',
      prediction_type: 'Absolute',
      change_in_price: 300,
      expiring_at: Time.now + 40
    }
  }

  let(:valid_headers) {
    {
      "Auth-Token": @user.token
    }
  }

  describe "GET #index" do
    it "returns a success response" do
      get :index, params: {}
      expect(response).to be_success
    end

    it "returns the list of user's predictions" do
      get :index, params: {}

      response_length = JSON.parse(response.body)['predictions'].length
      expect(response_length).to eq @user.predictions.count
    end
  end

  describe "POST #create" do
    context "with valid params" do
      it "creates a new Prediction" do
        expect {
          post :create, params: { prediction: valid_attributes }
        }.to change(Prediction, :count).by(1)
      end

      it "returns a json with the Prediction's data" do
        post :create, params: { prediction: valid_attributes }

        expect(response.body['coin']).to eq valid_attributes['coin']
      end
    end

    context "with invalid params" do
      it "returns a success response" do
        post :create, params: { prediction: invalid_attributes}
        expect(response).to be_success
      end

      it "returns a json describing the error" do
        post :create, params: { prediction: invalid_attributes}
        expect(JSON.parse(response.body)['error']).to eq 'Validation failed: Coin is not included in the list, Exchange is not included in the list, Currency is not included in the list'
      end
    end
  end
end
